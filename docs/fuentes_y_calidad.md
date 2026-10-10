# Fuentes y calidad

## Evidencia documental

Documentos del proyecto consultados para preparar el portafolio:

- `02_Memoria_Proyecto_SIACS.pdf`, edición 1.0, 09/09/2026: alcance, fuentes, arquitectura, estados y límites.
- `04_Demostracion_SIACS.pdf`, edición 1.0, 09/09/2026: recorrido local con un caso ficticio y cinco capturas.

Son referencias de procedencia, no enlaces a archivos incluidos en el repositorio. No se publica el expediente documental completo ni la dirección del servicio alojado.

## Archivo de referencia

Nombre: `asociaciones_Agosto_2026.xlsx`.

SHA-256: `ac1ef4cc8294f0f489ea8347d9076160c584754a4cd9371c4efd8f2a848bab77`.

La lectura del archivo aportado confirma 28.112 registros y 35 columnas. Su hoja «Metadatos» declara una dimensión A1 incorrecta: es necesario ignorar o recalcular ese límite al leer. El archivo no está vacío.

Selección: `Municipio = Santurtzi` y `Clasificación` en `Cultura General`, `Cultural Específico`.

| Comprobación documentada | Resultado |
|---|---:|
| Registros de Santurtzi | 354 |
| Selección cultural | 189 |
| Cultura General | 176 |
| Cultural Específico | 13 |
| Identificadores distintos en la selección | 189 |
| CIF sin informar | 144 |
| Teléfono sin informar | 189 |
| Correo electrónico sin informar | 189 |
| Página web sin informar | 189 |
| Sitio web sin informar | 186 |
| Fecha de constitución sin informar | 22 |

Los resultados corresponden a la instantánea aportada, no a una consulta actual al registro. «Página web» y «Sitio web» son campos diferentes. Una inscripción no demuestra actividad municipal reciente; la clasificación no determina elegibilidad para subvenciones. La ausencia de información no se atribuye a una causa no acreditada.

La aplicación declara un corte externo de 19/08/2026. Esa fecha no se presenta como fecha de descarga demostrada del archivo.

## Datos publicados

Los CSV del repositorio se han creado desde cero para el ejemplo; no son una anonimización del Excel ni contienen filas extraídas de él. Toda fila tiene `naturaleza = sintetico`. Se evita mezclar las muestras sintéticas con agregados de referencia externa en un mismo KPI.
