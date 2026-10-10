# KPIs del ejemplo reproducible

Fecha de referencia: **2026-09-30**. Periodo de eventos: **2026-09-01 a 2026-09-30**, ambos incluidos. Todos los datos de los CSV son sintéticos.

| Indicador | Definición |
|---|---|
| Asociaciones incluidas | Fichas cuyo estado no es `inactivo` en esta instantánea. |
| Cobertura de verificación | Fichas `verificado` / fichas incluidas × 100. |
| Antigüedad de revisión | Mediana de días desde `fecha_revision`, solo entre fichas incluidas que tienen fecha; se informa cobertura. |
| Ejecución de eventos | Eventos `ejecutado` / todos los eventos del periodo, incluyendo cancelados × 100. |
| Ocupación ponderada | Suma de asistentes / suma de aforos para los eventos ejecutados con ambos datos × 100. No es la media simple de porcentajes. |
| Coste por asistencia | Suma de costes / suma de asistentes para los eventos ejecutados con ambos datos. Se informa cobertura. |

Un denominador cero devuelve «No calculable». Un dato ausente no se sustituye por cero. Las asistencias no equivalen a personas únicas. El estado de asociación es una instantánea: no permite reconstruir estados históricos.

## Resultados esperados de los CSV incluidos

- 6 asociaciones totales, 5 incluidas y 3 verificadas: **60 %**.
- Fechas de revisión disponibles en 3 de las 5 incluidas: mediana **20 días**.
- 8 eventos en septiembre, 5 ejecutados: **62,5 %**.
- Aforo y asistencia conocidos en 4 de los 5 ejecutados: 210 / 270 = **77,78 %**.
- Coste y asistencia conocidos en 4 de los 5 ejecutados: 2.400 / 210 = **11,43 EUR/asistencia**.

Estos resultados corresponden exclusivamente al pequeño ejemplo técnico del repositorio. No deben coincidir con las cifras simuladas de las capturas del MVP, que proceden de otra muestra.

## Indicadores propuestos para un piloto

La memoria añade completitud mínima, actualización, justificación de subvenciones, uso de locales e incidencias. Sus denominadores y reglas deben acordarse con Cultura. La presencia de campos no acredita veracidad; una ficha verificada puede contener información incompleta. No se implementan esos indicadores adicionales en este ejemplo.
