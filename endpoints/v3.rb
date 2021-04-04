require 'sinatra/base'

class V3 < Sinatra::Base
  get '/v3' do
    content_type :json

    municipalities = Renamu2019.where(uniformized_params)

    municipalities.to_json
  end

  get '/v3/:id' do
    content_type :json

    municipality = Renamu2019.find_by(idmunici: params[:id])

    municipality.to_json
  end

  def uniformized_params
    {
      ccdd: params[:coddpto],
      ccpp: params[:codprov],
      ccdi: params[:coddist],
      tipomuni: Renamu2019::TIPOS.select { |key, value| value == params[:tipo] }.keys.first,
    }.select { |key, value| value }
  end
end
