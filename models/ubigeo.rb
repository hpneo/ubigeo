require_relative './base'

class Ubigeo < Base
  self.table_name = './db/ubigeo.dbf'

  def as_json
    {
      ubigeo: "#{coddpto}#{codprov}#{coddist}",
      coddpto: coddpto,
      codprov: codprov,
      coddist: coddist,
      nombre: nombre,
      tipo: tipo,
    }
  end

  def tipo
    if coddist == "00"
      if codprov == "00"
        return "departamento"
      else
        return "provincia"
      end
    end

    "distrito"
  end

  def provincias
    @provincias ||= Ubigeo.where(coddist: '00', coddpto: coddpto).select do |province|
      province[:codprov] != '00'
    end
  end

  def distritos
    @distritos ||= Ubigeo.where(codprov: codprov, coddpto: coddpto).select do |district|
      district[:coddist] != '00'
    end
  end
end
