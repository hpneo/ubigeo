require 'sinatra'
require 'json'
require 'dbf'

class Application < Sinatra::Base
  set :protection, :except => :json_csrf
  @@table = DBF::Table.new('db/ubigeo.dbf')

  before do
    if request.request_method == 'OPTIONS'
      response.headers["Access-Control-Allow-Origin"] = "*"
      response.headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
      response.headers["Access-Control-Max-Age"] = "1000"
      response.headers["Access-Control-Allow-Headers"] = "*,x-requested-with"
      halt 200
    end
  end

  get '/departamentos' do
    content_type :json

    departments = @@table.find(:all, codprov: '00', coddist: '00')

    departments.map{ |department|
      {
        coddpto: department[:coddpto],
        nombre: department[:nombre]
      }
    }.to_json
  end

  get '/departamentos/:id' do
    content_type :json

    department = @@table.find(:first, coddist: '00', codprov: '00', coddpto: params[:id])

    {
      coddpto: department[:coddpto],
      nombre: department[:nombre],
      provincias: provincias(department[:coddpto])
    }.to_json
  end

  get '/departamentos/:department_id/provincias/:id' do
    content_type :json

    province = @@table.find(:first, coddist: '00', codprov: params[:id], coddpto: params[:department_id])

    {
      coddpto: province[:coddpto],
      codprov: province[:codprov],
      nombre: province[:nombre],
      distritos: distritos(province[:coddpto], province[:codprov])
    }.to_json
  end

  get '/ubigeo/:id' do
    content_type :json

    ubigeo = params[:id].scan(/.{1,2}/m)

    case ubigeo.count
    when 1
      department = @@table.find(:first, coddist: '00', codprov: '00', coddpto: ubigeo[0])

      {
        coddpto: department[:coddpto],
        nombre: department[:nombre],
        provincias: provincias(department[:coddpto])
      }.to_json
    when 2
      province = @@table.find(:first, coddist: '00', codprov: ubigeo[1], coddpto: ubigeo[0])

      {
        coddpto: province[:coddpto],
        codprov: province[:codprov],
        nombre: province[:nombre],
        distritos: distritos(province[:coddpto], province[:codprov])
      }.to_json
    when 3
      district = @@table.find(:first, coddist: ubigeo[2], codprov: ubigeo[1], coddpto: ubigeo[0])

      {
        coddpto: district[:coddpto],
        codprov: district[:codprov],
        coddist: district[:coddist],
        nombre: district[:nombre]
      }.to_json
    end
  end

  private
  def provincias(coddpto)
    provinces = @@table.find(:all, coddist: '00', coddpto: coddpto).select{ |province|
      province[:codprov] != '00'
    }

    provinces.map{ |province|
      {
        coddpto: province[:coddpto],
        codprov: province[:codprov],
        nombre: province[:nombre]
      }
    }
  end

  def distritos(coddpto, codprov)
    districts = @@table.find(:all, codprov: codprov, coddpto: coddpto).select{ |district|
      district[:coddist] != '00'
    }

    districts.map{ |district|
      {
        coddpto: district[:coddpto],
        codprov: district[:codprov],
        coddist: district[:coddist],
        nombre: district[:nombre]
      }
    }
  end
end