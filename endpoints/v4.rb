require 'sinatra/base'

class V4 < Sinatra::Base
  get '/v4' do
    content_type :json

    municipalities = Renamu2020.where(uniformized_params)

    municipalities.to_json
  end

  get '/v4/:id' do
    content_type :json

    municipality = Renamu2020.find_by(idmunici: params[:id])

    municipality.to_json
  end

  def uniformized_params
    {
      ccdd: params[:coddpto],
      ccpp: params[:codprov],
      ccdi: params[:coddist],
      tipomuni: Renamu2020::TIPOS.select { |key, value| value == params[:tipo] }.keys.first,
    }.select { |key, value| value }
  end
end
