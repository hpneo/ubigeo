# Versión anterior, actualizado al 2006

## Uso

### Listar departamentos:
https://ubigeo-pe.herokuapp.com/departamentos

```javascript
[
  {
    coddpto: "01",
    nombre: "AMAZONAS"
  },
  {
    coddpto: "02",
    nombre: "ANCASH"
  },
  {
    coddpto: "03",
    nombre: "APURIMAC"
  },
  {
    coddpto: "04",
    nombre: "AREQUIPA"
  },
  {
    coddpto: "05",
    nombre: "AYACUCHO"
  },
  {
    coddpto: "06",
    nombre: "CAJAMARCA"
  },
  {
    coddpto: "07",
    nombre: "CALLAO"
  },
  {
    coddpto: "08",
    nombre: "CUSCO"
  },
  {
    coddpto: "09",
    nombre: "HUANCAVELICA"
  },
  {
    coddpto: "10",
    nombre: "HUANUCO"
  },
  {
    coddpto: "11",
    nombre: "ICA"
  },
  {
    coddpto: "12",
    nombre: "JUNIN"
  },
  {
    coddpto: "13",
    nombre: "LA LIBERTAD"
  },
  {
    coddpto: "14",
    nombre: "LAMBAYEQUE"
  },
  {
    coddpto: "15",
    nombre: "LIMA"
  },
  {
    coddpto: "16",
    nombre: "LORETO"
  },
  {
    coddpto: "17",
    nombre: "MADRE DE DIOS"
  },
  {
    coddpto: "18",
    nombre: "MOQUEGUA"
  },
  {
    coddpto: "19",
    nombre: "PASCO"
  },
  {
    coddpto: "20",
    nombre: "PIURA"
  },
  {
    coddpto: "21",
    nombre: "PUNO"
  },
  {
    coddpto: "22",
    nombre: "SAN MARTIN"
  },
  {
    coddpto: "23",
    nombre: "TACNA"
  },
  {
    coddpto: "24",
    nombre: "TUMBES"
  },
  {
    coddpto: "25",
    nombre: "UCAYALI"
  }
]
```

### Listar provincias de un departamento:
https://ubigeo-pe.herokuapp.com/departamentos/15

```javascript
{
  coddpto: "15",
  nombre: "LIMA",
  provincias: [
    {
      coddpto: "15",
      codprov: "01",
      nombre: "LIMA"
    },
    {
      coddpto: "15",
      codprov: "02",
      nombre: "BARRANCA"
    },
    {
      coddpto: "15",
      codprov: "03",
      nombre: "CAJATAMBO"
    },
    {
      coddpto: "15",
      codprov: "04",
      nombre: "CANTA"
    },
    {
      coddpto: "15",
      codprov: "05",
      nombre: "CAÑETE"
    },
    {
      coddpto: "15",
      codprov: "06",
      nombre: "HUARAL"
    },
    {
      coddpto: "15",
      codprov: "07",
      nombre: "HUAROCHIRI"
    },
    {
      coddpto: "15",
      codprov: "08",
      nombre: "HUAURA"
    },
    {
      coddpto: "15",
      codprov: "09",
      nombre: "OYON"
    },
    {
      coddpto: "15",
      codprov: "10",
      nombre: "YAUYOS"
    }
  ]
}
```

### Listar distritos de una provincia:
https://ubigeo-pe.herokuapp.com/departamentos/15/provincias/01

```javascript
{
  coddpto: "15",
  codprov: "01",
  nombre: "LIMA",
  distritos: [
    {
      coddpto: "15",
      codprov: "01",
      coddist: "01",
      nombre: "LIMA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "02",
      nombre: "ANCON"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "03",
      nombre: "ATE"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "04",
      nombre: "BARRANCO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "05",
      nombre: "BREÑA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "06",
      nombre: "CARABAYLLO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "07",
      nombre: "CHACLACAYO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "08",
      nombre: "CHORRILLOS"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "09",
      nombre: "CIENEGUILLA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "10",
      nombre: "COMAS"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "11",
      nombre: "EL AGUSTINO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "12",
      nombre: "INDEPENDENCIA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "13",
      nombre: "JESUS MARIA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "14",
      nombre: "LA MOLINA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "15",
      nombre: "LA VICTORIA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "16",
      nombre: "LINCE"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "17",
      nombre: "LOS OLIVOS"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "18",
      nombre: "LURIGANCHO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "19",
      nombre: "LURIN"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "20",
      nombre: "MAGDALENA DEL MAR"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "21",
      nombre: "PUEBLO LIBRE"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "22",
      nombre: "MIRAFLORES"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "23",
      nombre: "PACHACAMAC"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "24",
      nombre: "PUCUSANA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "25",
      nombre: "PUENTE PIEDRA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "26",
      nombre: "PUNTA HERMOSA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "27",
      nombre: "PUNTA NEGRA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "28",
      nombre: "RIMAC"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "29",
      nombre: "SAN BARTOLO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "30",
      nombre: "SAN BORJA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "31",
      nombre: "SAN ISIDRO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "32",
      nombre: "SAN JUAN DE LURIGANCHO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "33",
      nombre: "SAN JUAN DE MIRAFLORES"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "34",
      nombre: "SAN LUIS"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "35",
      nombre: "SAN MARTIN DE PORRES"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "36",
      nombre: "SAN MIGUEL"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "37",
      nombre: "SANTA ANITA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "38",
      nombre: "SANTA MARIA DEL MAR"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "39",
      nombre: "SANTA ROSA"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "40",
      nombre: "SANTIAGO DE SURCO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "41",
      nombre: "SURQUILLO"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "42",
      nombre: "VILLA EL SALVADOR"
    },
    {
      coddpto: "15",
      codprov: "01",
      coddist: "43",
      nombre: "VILLA MARIA DEL TRIUNFO"
    }
  ]
}
```

### Detalle de ubicación por UBIGEO:
https://ubigeo-pe.herokuapp.com/ubigeo/150120

```javascript
{
  coddpto: "15",
  codprov: "01",
  coddist: "20",
  nombre: "MAGDALENA DEL MAR"
}
```