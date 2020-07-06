require_relative './base'

class Directorio < Base
  self.table_name = './db/directorio.dbf'
  TIPOS = {
    1 => "provincia",
    2 => "distrito",
    3 => "centro_poblado",
  }.freeze

  def as_json
    {
      ubigeo: idmunici,
      coddpto: ccdd,
      codprov: ccpp,
      coddist: ccdi,
      nombre: distrito,
      tipo: TIPOS[catmuni],
      direccion: p04,
      facebook: p07.downcase,
      email: p08.downcase,
      website: p09.downcase,
    }
  end
end
