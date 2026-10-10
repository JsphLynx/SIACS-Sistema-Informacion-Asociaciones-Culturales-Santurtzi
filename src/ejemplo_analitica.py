"""KPIs de portafolio con datos sinteticos. Ejecutable desde Spyder o terminal."""

import csv
from datetime import date
from decimal import Decimal
from pathlib import Path
from statistics import median

DATOS = Path(__file__).resolve().parents[1] / "data"
INICIO = date(2026, 9, 1)
CORTE = date(2026, 9, 30)


def cargar_csv(nombre, clave):
    """Leer sin modificar; rechazar duplicados y datos ajenos a la simulacion."""
    with (DATOS / nombre).open(encoding="utf-8", newline="") as archivo:
        filas = list(csv.DictReader(archivo))
    ids = [fila[clave] for fila in filas]
    if len(ids) != len(set(ids)):
        raise ValueError(f"Identificadores duplicados en {nombre}")
    if any(fila["naturaleza"] != "sintetico" for fila in filas):
        raise ValueError("Este ejemplo solo admite datos sinteticos")
    return filas


def cociente(numerador, denominador, factor=1):
    """Conservar un denominador cero como no calculable, sin inventar ceros."""
    return numerador * factor / denominador if denominador else None


def mostrar(valor):
    return "No calculable" if valor is None else f"{valor:.2f}"


def calcular_indicadores(asociaciones, eventos):
    ids = {fila["asociacion_id"] for fila in asociaciones}
    if any(fila["asociacion_id"] not in ids for fila in eventos):
        raise ValueError("Evento sin asociacion existente")
    incluidas = [fila for fila in asociaciones if fila["estado"] != "inactivo"]
    verificadas = sum(fila["estado"] == "verificado" for fila in incluidas)
    dias = [(CORTE - date.fromisoformat(fila["fecha_revision"])).days
            for fila in incluidas if fila["fecha_revision"]]
    if any(dia < 0 for dia in dias):
        raise ValueError("Una revision es posterior a la fecha de corte")
    periodo = [fila for fila in eventos
               if INICIO <= date.fromisoformat(fila["fecha"]) <= CORTE]
    ejecutados = [fila for fila in periodo if fila["estado"] == "ejecutado"]
    ocupacion = [fila for fila in ejecutados if fila["aforo"] and fila["asistentes"]]
    costes = [fila for fila in ejecutados if fila["coste_eur"] and fila["asistentes"]]
    for fila in eventos:
        if fila["aforo"] and int(fila["aforo"]) <= 0:
            raise ValueError("Aforo no positivo")
        if fila["asistentes"] and int(fila["asistentes"]) < 0:
            raise ValueError("Asistencias negativas")
        if fila["coste_eur"] and Decimal(fila["coste_eur"]) < 0:
            raise ValueError("Coste negativo")
    return {
        "asociaciones_totales": len(asociaciones),
        "incluidas": len(incluidas),
        "verificadas": verificadas,
        "verificacion_pct": cociente(verificadas, len(incluidas), 100),
        "revisiones_con_fecha": len(dias),
        "mediana_dias_revision": median(dias) if dias else None,
        "eventos_periodo": len(periodo),
        "ejecutados": len(ejecutados),
        "ejecucion_pct": cociente(len(ejecutados), len(periodo), 100),
        "cobertura_ocupacion": len(ocupacion),
        "ocupacion_pct": cociente(sum(int(f["asistentes"]) for f in ocupacion),
                                  sum(int(f["aforo"]) for f in ocupacion), 100),
        "cobertura_coste": len(costes),
        "coste_por_asistencia_eur": cociente(
            sum((Decimal(f["coste_eur"]) for f in costes), Decimal(0)),
            sum(int(f["asistentes"]) for f in costes)),
    }


def main():
    asociaciones = cargar_csv("asociaciones_demo.csv", "asociacion_id")
    eventos = cargar_csv("eventos_demo.csv", "evento_id")
    resultados = calcular_indicadores(asociaciones, eventos)
    print(f"SIACS | DATOS SINTETICOS | {INICIO} a {CORTE}")
    for nombre, valor in resultados.items():
        print(f"{nombre}: {mostrar(valor)}")


if __name__ == "__main__":
    main()
