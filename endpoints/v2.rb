require 'sinatra/base'

class V2 < Sinatra::Base
  get '/v2' do
    content_type :json

    municipalities = Renamu2018.where(uniformized_params)

    municipalities.to_json
  end

  get '/v2/:id' do
    content_type :json

    municipality = Renamu2018.find_by(idmunici: params[:id])

    municipality.to_json
  end

  def uniformized_params
    {
      ccdd: params[:coddpto],
      ccpp: params[:codprov],
      ccdi: params[:coddist],
      catmuni: Renamu2018::TIPOS.select { |key, value| value == params[:tipo] }.keys.first,
    }.select { |key, value| value }
  end
end
