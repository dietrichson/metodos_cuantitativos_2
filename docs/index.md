--- 
title: "Métodos Cuantitativos"
author: "Aleksander Dietrichson, PhD"
date: "13 de julio de 2022"
site: bookdown::bookdown_site
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: true
github-repo: dietrichson/metodos_cuantitativos
description: "Material de Cátedra para el curso «Metodologías cuantitativas»."
documentclass: book
csl: chicago-fullnote-bibliography.csl
---

# Prefacio {-}

Este texto ha sido editado en respuesta a la aparente falta de un libro de texto introductorio al análisis cuantitativo y estadísticas acesible y moderno en castellano. Si bien fue concebido como material de cátedra para *Metodologías cuantitativas* materia que dicta el autor en la Escuela de Humanidades de la Universidad Nacional San Martín, se adaptará fácilmente a cursos introductorios de estadísticas en general. 

## Segunda edición {-}

En la segunda edición se corrigió algunos errores ortográficos y de estilo. Optamos por actualizar los ejemplos para incorporar los paquetes del «tidyverse» ya que hemos observado que su uso y adaptación atenúa la curva de aprendizaje para quienes usan R por primera vez o con escasos conocimientos previos. 

## Estructura del libro {-}

Cada capítulo desarrolla un tema y/o concepto a ser tratado en clase y la secuencia corresponde a un curso introductorio de estadístocos «clásico», por lo que conviene leerlos en orden. Sigue el orden propuesto por @butler1985statistics.

### Glosario {-}

Uno de los objetivos de este trabajo es dotar al lector con las herramientas necesarios para convertirse en un consumidor crítico de textos que se valen de métodos cuantitativos y/o estadísticas para su argumento. En vista de la enorme cantidad de material disponible en inglés, sobre todo en el ámbito acadédico, el autor ha optado por incluir terminología bilingüe español-inglés. Esta elección obedece a un criterio práctico. En cada capítulo encontrarán un glosario con los principales términos mencionados. Incluye traducción a inglés y referencias a R cuando sea relevante.

## R y Rstudio {-}

*R* es un leguaje de programación especializado para análisis de datos. Es de fuente abierta (Open Source) y uso gratuito. *Rstudio* es un editor de *R* que también de uso sin cargo. Ambas herramientas están disponibles en internet y son de amplio uso tanto en el mundo académico como la industria. 

Se puede descargar e instalar R accediendo a esta URL: https://cran.r-project.org/mirrors.html.

Para Rstudio la URL es: https://www.rstudio.com/products/rstudio/download/#download.

Se recomienda siempre instalar R primero y luego Rstudio ya que este depende de aquel.

### Ejemplos en R {-}

A lo largo de este libro encontrarán ejemplos prácticos que pueden ejecutarse en R. El código se diferenciará del resto del texto por su formato, como se puede apreciar en el ejemplo siguiente:
 

```r
1+1
```

```
#> [1] 2
```

Por convención no se incluye el promt (p.e. ">") de la consola de R, y los valores de retorno son comentados con "##", lo que corresponde al estándar para textos técnicos de esta índole. También se puede hacer referencia a código dentro del texto corrido con el mismo formato. Por ejemplo: ```1+1```.

## Edición {-}

Este texto fue editado con *bookdown* [@R-bookdown], un paquete de R [@R-bookdown] que extiende las capacidades de *knitr*[@xie2015] y R-markdown [@R-rmarkdown] para publicaciones más voluminosas. También hace uso de los paquetes *tidyverse* [@tidyverse] y *bayestestR*[@bayestestR].

## Agradecimientos {-}

Agradezco a mi colega Diego Forteza por su ayuda y apoyo en durante el proceso de redacción y a Cecilia Magadán por su corrección de estilo.

Debo expresar también profunda gratitud a *Bow Street Destillery* en Dublin, Irlanda; sin cuyos productos este proyecto habría sin duda quedado inconcluso.
