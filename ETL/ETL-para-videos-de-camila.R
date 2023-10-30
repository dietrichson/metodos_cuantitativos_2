# Template de ETL para análisis de images de videos
# Fecha: 2023-10-30

# Agregar source para el archivo donde tenés color_analysis.

output_filename <- here::here("data/imagenes-procesadas.rds")

mis_frames <- dir()# Agregar path a las imágenes a analizar

## Para testing

mis_frames <- mis_frames[1:2] # Removes para correr «en serio»

my_data <- color_analysis(mis_frames)

my_data$imgage_path <- mis_frames

readr::write_rds(my_data,output_filename)