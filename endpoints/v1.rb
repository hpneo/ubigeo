require 'sinatra/base'

class V1 < Sinatra::Base
  get '/v1' do
    content_type :json

    municipalities = Ubigeo.where(params)

    municipalities.to_json
  end

  get '/v1/departamentos' do
    content_type :json

    departments = Ubigeo.where(codprov: '00', coddist: '00')

    departments.to_json
  end

  get '/v1/departamentos/:id' do
    content_type :json

    department = Ubigeo.where(coddist: '00', codprov: '00', coddpto: params[:id]).first

    {
      coddpto: department[:coddpto],
      nombre: department[:nombre],
      provincias: department.provincias,
    }.to_json
  end

  get '/v1/departamentos/:department_id/provincias/:id' do
    content_type :json

    province = Ubigeo.where(coddist: '00', codprov: params[:id], coddpto: params[:department_id]).first

    {
      coddpto: province[:coddpto],
      codprov: province[:codprov],
      nombre: province[:nombre],
      distritos: province.distritos,
    }.to_json
  end

  get '/v1/ubigeo/:id' do
    content_type :json

    ubigeo = params[:id].scan(/.{1,2}/m)

    case ubigeo.count
    when 1
      department = Ubigeo.where(coddist: '00', codprov: '00', coddpto: ubigeo[0]).first

      {
        coddpto: department[:coddpto],
        nombre: department[:nombre],
        provincias: department.provincias,
      }.to_json
    when 2
      province = Ubigeo.where(coddist: '00', codprov: ubigeo[1], coddpto: ubigeo[0]).first

      {
        coddpto: province[:coddpto],
        codprov: province[:codprov],
        nombre: province[:nombre],
        distritos: province.distritos,
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
end
