require 'sinatra/base'

class Legacy < Sinatra::Base
  get '/departamentos' do
    content_type :json

    departments = Ubigeo.where(codprov: '00', coddist: '00')

    departments.map do |department|
      {
        coddpto: department[:coddpto],
        nombre: department[:nombre],
      }
    end.to_json
  end

  get '/departamentos/:id' do
    content_type :json

    department = Ubigeo.where(coddist: '00', codprov: '00', coddpto: params[:id]).first

    {
      coddpto: department[:coddpto],
      nombre: department[:nombre],
      provincias: provincias(department[:coddpto]),
    }.to_json
  end

  get '/departamentos/:department_id/provincias/:id' do
    content_type :json

    province = Ubigeo.where(coddist: '00', codprov: params[:id], coddpto: params[:department_id]).first

    {
      coddpto: province[:coddpto],
      codprov: province[:codprov],
      nombre: province[:nombre],
      distritos: distritos(province[:coddpto], province[:codprov]),
    }.to_json
  end

  get '/ubigeo/:id' do
    content_type :json

    ubigeo = params[:id].scan(/.{1,2}/m)

    case ubigeo.count
    when 1
      department = Ubigeo.where(coddist: '00', codprov: '00', coddpto: ubigeo[0]).first

      {
        coddpto: department[:coddpto],
        nombre: department[:nombre],
        provincias: provincias(department[:coddpto]),
      }.to_json
    when 2
      province = Ubigeo.where(coddist: '00', codprov: ubigeo[1], coddpto: ubigeo[0]).first

      {
        coddpto: province[:coddpto],
        codprov: province[:codprov],
        nombre: province[:nombre],
        distritos: distritos(province[:coddpto], province[:codprov]),
      }.to_json
    when 3
      district = Ubigeo.where(coddist: ubigeo[2], codprov: ubigeo[1], coddpto: ubigeo[0]).first

      {
        coddpto: district[:coddpto],
        codprov: district[:codprov],
        coddist: district[:coddist],
        nombre: district[:nombre],
      }.to_json
    end
  end

  private

  def provincias(coddpto)
    provinces = Ubigeo.where(coddist: '00', coddpto: coddpto).select do |province|
      province[:codprov] != '00'
    end

    provinces.map do |province|
      {
        coddpto: province[:coddpto],
        codprov: province[:codprov],
        nombre: province[:nombre],
      }
    end
  end

  def distritos(coddpto, codprov)
    districts = Ubigeo.where(codprov: codprov, coddpto: coddpto).select do |district|
      district[:coddist] != '00'
    end

    districts.map do |district|
      {
        coddpto: district[:coddpto],
        codprov: district[:codprov],
        coddist: district[:coddist],
        nombre: district[:nombre],
      }
    end
  end
end
