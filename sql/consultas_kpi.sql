-- Datos sinteticos. NULL significa No calculable cuando no existe denominador.
-- Cobertura de verificacion de la instantanea: 3 / 5 = 60 %.
SELECT COUNT(*) AS fichas_incluidas,
       SUM(CASE WHEN estado = 'verificado' THEN 1 ELSE 0 END) AS verificadas,
       100.0 * SUM(CASE WHEN estado = 'verificado' THEN 1 ELSE 0 END)
           / NULLIF(COUNT(*), 0) AS verificacion_pct
FROM asociaciones_demo WHERE estado <> 'inactivo';

-- Ejecucion: mantener cancelados y pendientes en el denominador.
SELECT COUNT(*) AS eventos_periodo,
       SUM(CASE WHEN estado = 'ejecutado' THEN 1 ELSE 0 END) AS ejecutados,
       100.0 * SUM(CASE WHEN estado = 'ejecutado' THEN 1 ELSE 0 END)
           / NULLIF(COUNT(*), 0) AS ejecucion_pct
FROM eventos_demo WHERE fecha BETWEEN '2026-09-01' AND '2026-09-30';

-- Cada cociente usa exclusivamente filas con ambos componentes conocidos.
WITH ejecutados AS (
    SELECT * FROM eventos_demo WHERE estado = 'ejecutado'
    AND fecha BETWEEN '2026-09-01' AND '2026-09-30'
)
SELECT COUNT(*) AS ejecutados,
       COUNT(CASE WHEN asistentes IS NOT NULL AND aforo IS NOT NULL THEN 1 END) AS cobertura_ocupacion,
       100.0 * SUM(CASE WHEN asistentes IS NOT NULL AND aforo IS NOT NULL THEN asistentes END)
           / NULLIF(SUM(CASE WHEN asistentes IS NOT NULL AND aforo IS NOT NULL THEN aforo END), 0) AS ocupacion_pct,
       COUNT(CASE WHEN asistentes IS NOT NULL AND coste_eur IS NOT NULL THEN 1 END) AS cobertura_coste,
       1.0 * SUM(CASE WHEN asistentes IS NOT NULL AND coste_eur IS NOT NULL THEN coste_eur END)
           / NULLIF(SUM(CASE WHEN asistentes IS NOT NULL AND coste_eur IS NOT NULL THEN asistentes END), 0) AS coste_por_asistencia
FROM ejecutados;

-- Importes concedidos conocidos, agregados sin unir eventos (evita duplicacion).
SELECT estado, COUNT(*) AS solicitudes, COUNT(concedido_eur) AS importes_conocidos,
       SUM(solicitado_eur) AS solicitado_eur, SUM(concedido_eur) AS concedido_eur
FROM subvenciones_demo WHERE ejercicio = 2026 GROUP BY estado ORDER BY estado;
