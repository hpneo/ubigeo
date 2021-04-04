require_relative './base'

class Renamu2019 < Base
  self.table_name = './db/renamu_2019.dbf'

  TIPOS = {
    1 => "provincia",
    2 => "distrito",
    3 => "centro_poblado",
  }.freeze

  TIPOS_VIA = {
    1 => "Avenida",
    2 => "Jiron",
    3 => "Calle",
    4 => "Pasaje",
    5 => "Carretera",
    6 => "",
  }.freeze

  def direccion
    [TIPOS_VIA[p04_1], p04_2, p04_3, p04_4, p04_5, p04_6].join(" ").strip
  end

  def as_json
    {
      ubigeo: idmunici,
      coddpto: ccdd,
      codprov: ccpp,
      coddist: ccdi,
      nombre: distrito,
      tipo: TIPOS[tipomuni],
      direccion: direccion,
      facebook: p07.downcase,
      email: p08.downcase,
      website: p09.downcase,
    }
  end
end
