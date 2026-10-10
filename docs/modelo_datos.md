# Modelo relacional del ejemplo

Este modelo se creó para el portafolio. No reproduce las cuatro tablas D1 del MVP ni pretende representar las 188 variables del formulario.

| Tabla | Granularidad | Relación |
|---|---|---|
| asociaciones_demo | Una asociación ficticia | Clave primaria `asociacion_id` |
| eventos_demo | Un evento planificado, ejecutado o cancelado | FK a asociación |
| subvenciones_demo | Una solicitud ficticia | FK a asociación |

Las claves son enteros de ejemplo, no números registrales oficiales. Se aplican restricciones de estado, naturaleza sintética, importes no negativos, asistentes no negativos y aforo positivo cuando se conoce.

Los importes monetarios se expresan en EUR. `NULL` representa desconocido; cero representa una cantidad conocida igual a cero. El coste solo se informa en eventos ejecutados. Una concesión pendiente mantiene importe concedido nulo.

No se unen eventos y subvenciones directamente para sumar importes: ambas relaciones son uno-a-muchos y producirían duplicación. Cada KPI agrega su propia tabla.

## Modelo objetivo del proyecto

La memoria propone separar asociación, actividad, evento, convocatoria, solicitud, concesión, justificación, edificio, local, cesión, activo, incidencia, documento, revisión e historial. La normalización completa y su migración se realizarían antes de un piloto, con pruebas de reconciliación y permisos.
