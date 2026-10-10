# Datos completamente sintéticos

Muestra educativa creada para el portafolio: 6 asociaciones, 8 eventos y 4 solicitudes. No procede de entidades reales ni se conecta al MVP.

| Archivo | Campos y significado |
|---|---|
| asociaciones_demo.csv | `asociacion_id`: PK entera; `denominacion`: nombre ficticio; `estado`: borrador, pendiente_revision, verificado o inactivo; `fecha_revision`: fecha ISO o vacío; `naturaleza`: siempre sintetico. |
| eventos_demo.csv | `evento_id`: PK; `asociacion_id`: FK; `fecha`: fecha ISO programada del evento; `estado`: planificado, ejecutado o cancelado; `aforo`: capacidad conocida; `asistentes`: asistencias registradas; `coste_eur`: coste imputable en EUR; `naturaleza`: sintetico. |
| subvenciones_demo.csv | `solicitud_id`: PK; `asociacion_id`: FK; `ejercicio`: año; `estado`: pendiente, concedida o denegada; `solicitado_eur`: importe solicitado; `concedido_eur`: importe decidido, vacío si pendiente; `naturaleza`: sintetico. |

Formato UTF-8, separador coma, decimal punto. Un campo vacío significa desconocido/no informado, no cero. No se incluyen contactos, coordenadas ni identificadores oficiales.

La instantánea de asociaciones y el periodo de eventos son los definidos en [KPIs](../docs/kpis.md). Los estados planificados al cierre representan actividad pendiente de cierre administrativo o ejecución, no eventos futuros respecto de la fecha actual.
