-- Modelo educativo independiente del MVP. Ejecutar en una base vacia de pruebas.
BEGIN;
CREATE TABLE asociaciones_demo (
    asociacion_id INTEGER PRIMARY KEY,
    denominacion TEXT NOT NULL,
    estado TEXT NOT NULL CHECK (estado IN ('borrador','pendiente_revision','verificado','inactivo')),
    fecha_revision DATE,
    naturaleza TEXT NOT NULL CHECK (naturaleza = 'sintetico')
);
CREATE TABLE eventos_demo (
    evento_id INTEGER PRIMARY KEY,
    asociacion_id INTEGER NOT NULL REFERENCES asociaciones_demo(asociacion_id),
    fecha DATE NOT NULL,
    estado TEXT NOT NULL CHECK (estado IN ('planificado','ejecutado','cancelado')),
    aforo INTEGER CHECK (aforo > 0),
    asistentes INTEGER CHECK (asistentes >= 0),
    coste_eur NUMERIC(12,2) CHECK (coste_eur >= 0),
    naturaleza TEXT NOT NULL CHECK (naturaleza = 'sintetico'),
    CHECK (estado = 'ejecutado' OR (asistentes IS NULL AND coste_eur IS NULL))
);
CREATE TABLE subvenciones_demo (
    solicitud_id INTEGER PRIMARY KEY,
    asociacion_id INTEGER NOT NULL REFERENCES asociaciones_demo(asociacion_id),
    ejercicio INTEGER NOT NULL CHECK (ejercicio BETWEEN 1900 AND 2100),
    estado TEXT NOT NULL CHECK (estado IN ('pendiente','concedida','denegada')),
    solicitado_eur NUMERIC(12,2) NOT NULL CHECK (solicitado_eur >= 0),
    concedido_eur NUMERIC(12,2) CHECK (concedido_eur >= 0),
    naturaleza TEXT NOT NULL CHECK (naturaleza = 'sintetico'),
    CHECK ((estado = 'pendiente' AND concedido_eur IS NULL)
        OR (estado = 'concedida' AND concedido_eur IS NOT NULL)
        OR (estado = 'denegada' AND concedido_eur = 0 AND concedido_eur IS NOT NULL))
);
CREATE INDEX eventos_demo_asociacion_fecha ON eventos_demo(asociacion_id, fecha);
CREATE INDEX subvenciones_demo_asociacion ON subvenciones_demo(asociacion_id);
COMMIT;
