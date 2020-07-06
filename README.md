# Ubigeo  - Listado de ubicaciones para Perú

Datos obtenidos de http://webinei.inei.gob.pe/anda_inei/index.php/catalog/REGISTROS#_r=&sort_by=proddate&sort_order=desc

> **Nota:** Estos son los códigos de Ubigeo del INEI. Los códigos de Ubigeo de RENIEC tienen algunos valores diferentes.

## Uso

### Listar municipalidades (Actualizado al 2018)

https://ubigeo-pe.herokuapp.com/v2

```javascript
[
  {
    ubigeo: "010101",
    coddpto: "01",
    codprov: "01",
    coddist: "01",
    nombre: "CHACHAPOYAS",
    tipo: "provincia",
    direccion: "Jr. Ortiz Arrieta N? 588",
    facebook: "www.facebook.com/munichachapoyas/",
    email: "alcaldia@munichachapoyas.gob.pe",
    website: "www.munichachapoyas.gob.pe"
  },
  // ...
]
```

### Filtrar por parámetros:

https://ubigeo-pe.herokuapp.com/v2?coddpto=01&codprov=02&tipo=provincia

```javascript
[
  {
    ubigeo: "010201",
    coddpto: "01",
    codprov: "02",
    coddist: "01",
    nombre: "BAGUA",
    tipo: "provincia",
    direccion: "Av. H?roes del Cenepa N? 1060",
    facebook: "www.facebook.com/munibaguaperu/",
    email: "secretariageneral@munibagua.gob.pe",
    website: "www.munibagua.gob.pe"
  },
  // ...
]
```

### Detalle de municipalidad por UBIGEO (Actualizado al 2018)

https://ubigeo-pe.herokuapp.com/v2/150120

```js
{
  ubigeo: "150120",
  coddpto: "15",
  codprov: "01",
  coddist: "20",
  nombre: "MAGDALENA DEL MAR",
  tipo: "distrito",
  direccion: "Av. Brasil N? 3501",
  facebook: "www.facebook.com/munimagdalena",
  email: "layarza@munimagdalena.gob.pe",
  website: "www.munimagdalena.gob.pe"
}
```

---

## Versión anterior (legacy)

[Ver LEGACY.md](LEGACY.md)
