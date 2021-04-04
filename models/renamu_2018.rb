require_relative './base'

class Renamu2018 < Base
  self.table_name = './db/renamu_2018.dbf'

  TIPOS = {
    1 => "provincia",
    2 => "distrito",
    3 => "centro_poblado",
  }.freeze

  def direccion
    p04
  end

  def as_json
    {
      ubigeo: idmunici,
      coddpto: ccdd,
      codprov: ccpp,
      coddist: ccdi,
      nombre: distrito,
      tipo: TIPOS[catmuni],
      direccion: direccion,
      facebook: p07.downcase,
      email: p08.downcase,
      website: p09.downcase,
    }
  end
end
