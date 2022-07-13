---
output:
  pdf_document: default
  html_document: default
---

# Pruebas paramétricas

En este capítulo vamos a desarrollar algunos técnicas estadísticos que nos permiten realizar una prueba o un test de diferencias entre medias de dos conjuntos de datos provenientes de muestras independientes o correlacionadas. Los tests que vamos a ver se llaman «paramétricos», lo cual quiere decir viene con algunas presunciones acerca de los datos:

1. Los datos son de escala de intervalo o razón
2. La población de la muestra debe aproximarse a una distribución normal
3. Las varianzas de las muestras debe aproximadamente similar^[Este requerimiento puede obviarse en algunos casos, sobre todo tenemos muestras grandes.]

Las pruebas estadísticas son las que nos permiten, a algún nivel de significanza, rechazar o aceptar la hipótesis nula ($H_0$), por lo que son de bastante utilidad en investigaciones cuantitativas. 

## Prueba t de Student para muestras independientes

Supongamos que tenemos dos muestras aleatorias e independientes con medias de $\bar{x_1}$ y $\bar{x_2}$ y que queremos saber si estas dos medias son signifacativamente distintas a un nivel de $p\leqslant0,05$. Esto es lo mismo que decir que si afirmamos que hay una diferencia entre las muestras tenemos un 95% de probabilidad de tener razón. Lo que tenemos que calcular, entonces, es la probabilidad de que las dos muestras pueder provenir de la misma distribución y que la diferencia que vemos es por varianza en esa población. En otras palabras: queremos saber si dos muestras con la diferencia observada ($\bar{x_1}-\bar{x_2}$) podrían tener provenir de la misma población.

Si sacamos un número significativo de muestras de una misma población la media de estas muestra va a tener una diferencia con la media de la población, en algunos casos más altos y en otros más bajos. Usamos este conocimiento para calcular el error estándar:

$$
SE = {\sigma\over{\sqrt{N}}}.
$$

De la misma manera existe un *error estándar de diferencias entre medias* (SED por sus siglas en ingles). 

::: {.definition #unnamed-chunk-1 name="Error estándar de diferencia entre medias"}
$$
SED = \sqrt{\sigma^2_1/N_1 + \sigma^2_1/N_2}
$$

donde:
  
* $\sigma^2_1$ y $\sigma^2_2$: las varianzas de las poblaciones 1 y 2 
* $N_1$ y $N_2$: es el número de observaciones en cada muestra.

:::

Al igual que con el error estándar, a menudo desconocemos la varianza de la población, por lo cual lo estimamos de la muestra y la formula es la que vemos en la definición \@ref(def:SED-samples).

::: {.definition #SED-samples name="Error estándar de diferencia entre medias estimado de muestras"}
$$
SED = \sqrt{s^2_1/N_1 + s^2_1/N_2}
$$

donde:
  
* $s^2_1$ y $s^2_2$: las varianzas de las muestras 1 y 2 
* $N_1$ y $N_2$: es el número de observaciones en cada muestra.

:::

Vimos en la sección \@ref(la-distribucion-t) que para muestras relativamente pequeñas (N<30) la distribución de la muestra tiende a la distribución *t de Student*. Podemos valernos de esto para calcular la probabilidad de que nuestro *SED* esté en el rango requerido aplicando la formula de la definición 

::: {.definition #test-t name="Prueba de t"}

$$
t = {{(\bar{x_1}-\bar{x_2})}\over{SED}}.
$$
  
:::

Si aplicamos la fórmula de la definición \@ref(def:test-t) nos sale un valor que podemos comparar con los valores críticos de la tabla del [apendice A](\@distribucion-t) para determinar si rechazamos $H_0$ o no.




::: {.example #manual-t-test name="Prueba t"}
:
:::
Volvemos ahora a nuestros datos de notas de dos grupos de estudiantes con diferentes metodologías pedagígicos. Queremos saber con un nivel de significanza de 0,05 si existe diferencia entre la media de los dos grupos. Nuestras hipótesis nula y alternativa son entonces:

$H_0:\mu_A=\mu_B$,

$H_1: \mu_A\neq\mu_B$.

Los datos son:

Grupo A: {15, 12, 11, 18, 15, 15, 9, 19, 14, 13, 11, 12, 18, 15, 16, 14, 16, 17, 15, 17, 13, 14, 13, 15, 17, 19, 17, 18, 16, 14} y 

Grupo B: {11, 16, 14, 18, 6, 8, 9, 14, 12, 12, 10, 15, 12, 9, 13, 16, 17, 12, 8, 7, 15, 5, 14, 13, 13, 12, 11, 13, 11, 7}.

La media y desviación estándar:

|    Grupo A:
|        $\bar{x_A} = 14,933$
|        $s = 2,490$
|        $N=30$

|    Grupo B:
|       $\bar{x} = 11,77$
|       $s = 3,308$
|       $N=30$.

Aplicando la fórmula de la definición \@ref(def:SED-samples) obtenemos:

$$
SED = \sqrt{s^2_1/N_1 + s^2_1/N_2} = \sqrt{2,490^2/30 + 3,308^2/N_2} = 0,756 
$$
  


y podemos calcular el valor de t aplicando la fórmula de la definición \@ref(def:test-t)

$$
t = {{\bar{x_1}-\bar{x_2}}\over{SED}} = {{14.933-11,766}\over{0,756}}=4,188.
$$

Si buscamos este valor en el  [Apendix A](#distribucion-t) para 29 grados de libertad (N-1), vemos que debemos rechazar $H_0$ y concluir que existe una diferencia estadísticamente significativa entre las dos muestras. Tenemos razón de creer que el método pedagógico influye en los resultados finales de los estudiantes.

::: {.example #t-test-in-r name="Prueba t en R"}
:
:::

Si no queremos hacer todos estos cálculos a mano podemos hacerlos en R usando la función ```t.test``. Toma como parámetros las dos muestras que queremos comparar.


```r
Grupo.A = c(15, 12, 11, 18, 15, 15, 9, 19, 14, 13, 11, 12, 18, 15, 16, 14, 16, 17, 15, 17, 13, 14, 13, 15, 17, 19, 17, 18, 16, 14)
Grupo.B = c(11, 16, 14, 18, 6, 8, 9, 14, 12, 12, 10, 15, 12, 9, 13, 16, 17, 12, 8, 7, 15, 5, 14, 13, 13, 12, 11, 13, 11, 7)
t.test(Grupo.A,Grupo.B)
```

```
#> 
#> 	Welch Two Sample t-test
#> 
#> data:  Grupo.A and Grupo.B
#> t = 4.1887, df = 53.88, p-value = 0.0001046
#> alternative hypothesis: true difference in means is not equal to 0
#> 95 percent confidence interval:
#>  1.650905 4.682428
#> sample estimates:
#> mean of x mean of y 
#>  14.93333  11.76667
```

Vemos que el test nos devuelve además un valor de *p* más preciso.

## Prueba de Shapiro-Wilks {#test-de-normalidad}

En la sección \@ref(evaluar-la-normalidad) mencionamos que existen algunas maneras de estimar si una variable tiene una distribución normal o no. Nos basamos sobre todo en la forma de los polígonos de frecuencias (\@ref(fig:poligono-de-frecuencias-notas-comparativo)). Ahora vamos a introducir un test más formal de normalidad. 

El test de *Shapiro-Wilks* plantea la hipótesis nula que una muestra proviene de una distribución normal. Eligimos un nivel de significanza, por ejemplo 0,05, y tenemos una hipótesis alternativa que sostiene que la distribución no es normal.

Tenemos:

$H_0$: La distribución es normal

$H_1$: La distribución no es normal,

o más formalmente aún:

$H_0: X \sim \mathcal{N}(\mu,\sigma^2)$

$H_1: X \nsim \mathcal{N}(\mu,\sigma^2)$.

Ahora el test Shapiro-Wilks intenta rechazar la hipotesis nula a nuestro nivel de significanza. Para realizar el test usamos la función ```shapiro.test``` en R:

::: {.example #unnamed-chunk-5 name="Test de Shapiro Wilks en R"}
:
:::


```r
Grupo.A = c(15, 12, 11, 18, 15, 15, 9, 19, 14, 13, 11, 12, 18, 15, 16, 14, 16, 17, 15, 17, 13, 14, 13, 15, 17, 19, 17, 18, 16, 14)

shapiro.test(Grupo.A)
```

```
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  Grupo.A
#> W = 0.97032, p-value = 0.548
```

```r
Grupo.B = c(11, 16, 14, 18, 6, 8, 9, 14, 12, 12, 10, 15, 12, 9, 13, 16, 17, 12, 8, 7, 15, 5, 14, 13, 13, 12, 11, 13, 11, 7)


shapiro.test(Grupo.B)
```

```
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  Grupo.B
#> W = 0.97636, p-value = 0.7227
```

Vemos que en ambos casos el valor de probabilidad (*p*) es muy superios a nuestro nivel elegido (0,05), por lo que *no rechazamos la hipótesis nula*.

En el caso de los ejemplos \@ref(exm:manual-t-test) y \@ref(exm:t-test-in-r) ya obramos bajo la premisa de que las variables tenían una distribución normal, pero generalmente conviene realizar el test Shapiro-Willks *antes* de decidir qué prueba estadística vamos a usar.  Si rechazamos $H_0$, es decir si no concluimos que la distribución sea normal, no deberíamos usar un test paramétrico. 

## Prueba de Fisher 

Al inicio del capítulo también vimos que uno de los requisitos para que una prueba estadística paramétrica sea válida es que las varianzas sean de similar magnitud. Para ello también existe un test, el *test de Fisher*^[tambien: «F-test»] que plantea las hipótesis:

$H_0: \sigma^2_1 = \sigma^2_2$,

$H_1: \sigma^2_1 \neq \sigma^2_2$

Sin entrar en mucho detalle teórico, en R hay una función ```var.test``` para este propósito. La función toma dos argumentos: los dos conjuntos de datos que queremos comparar.

::: {.example #unnamed-chunk-7 name="Realizar la prueba de Fisher en R"}
:
:::


```r
var.test(Grupo.A, Grupo.B)
```

```
#> 
#> 	F test to compare two variances
#> 
#> data:  Grupo.A and Grupo.B
#> F = 0.56675, num df = 29, denom df = 29, p-value =
#> 0.1321
#> alternative hypothesis: true ratio of variances is not equal to 1
#> 95 percent confidence interval:
#>  0.2697517 1.1907335
#> sample estimates:
#> ratio of variances 
#>          0.5667472
```

Vemos que el valor de probabilidad $p$ es mayor a nuestro nivel de significanza ($p\leqslant0,05$), con lo cual *no rechazamos* $H_0$ y concluimos que las varianzas son relativamente similares. 

## Prueba t para muestras pareadas

En los ejemplos \@ref(exm:manual-t-test) y \@ref(exm:t-test-in-r) teníamos dos grupos de estudiantes de dos cursos distintos, pero en muchos tenemos observaciones *pareadas* o datos *interdependientes*. Esto es muy típico de investigaciones experimentales en los que medimos la variable dependiente antes y después^[también se conoce como «medidas repetidas»] de cambiar la variable independiente. Si, por ejemplo, queremos investigar el efecto de la cafeína sobre el pulso sanguineo podríamos obtener una muestra de personas y tomarles el pulso antes y después de hacerles tomar una taza de café.

En este sacamos las diferencias entre las dos medidas y comparamos estas diferencias con la distribución teórica. La fórmula está en la definición \@ref(def:dependent-t-test).

::: {.definition #dependent-t-test name="Prueba t para muestras dependientes"}

$$
t = {{\bar{X}_D}\over{s_D\over{\sqrt{n}}}}
$$
:::
  
  donde:
  
* ${\bar{X}_D}$: media de las diferencias 
* $s_D$: la desviación estándar de las diferencias
* n: número de pares de observaciones.



Lo que nos va a decir la prueba t en este caso es si la diferencia es significativamente diferente a cero: Si la variable independiente no tiene efecto entonces debería dar lo mismo medir antes o después. Las hipótesis planteadas son, por tanto:

$H_0: \bar{X}_D = 0$,

$H_1: \bar{X}_D \neq 0$.


::: {.example #dependent-t-test-example name="Prueba t dependiente"}
:
:::

En este ejemplo [@Shier2004] vamos a suponer que tenemos un grupo de veinte estudiantes y queremos investigar el efecto del uso de algún recurso didáctico, por ejemplo un video en YouTube, en su destreza para resolver cierto tipo de problemas matemáticos. Les tomamos un test inicial, pedimos que miren el video y cuando terminen tomamos otro test. Ahora tenemos dos observaciones de cada estudiante. Calculamos la diferencia entre ellos. El resultado de todo esto está resumido en la tabla \@ref(tab:diff-table).




Table: (\#tab:diff-table)Resultados de dos tests de matemáticas

|Nombre    | Antes| Después| Diferencia|
|:---------|-----:|-------:|----------:|
|Manuel    |    18|      22|          4|
|Miguel    |    21|      25|          4|
|José      |    16|      17|          1|
|Antonio   |    22|      24|          2|
|Dolores   |    19|      16|         -3|
|Manuela   |    24|      29|          5|
|Pedro     |    17|      20|          3|
|Lucía     |    21|      23|          2|
|Cecilia   |    23|      19|         -4|
|Juan      |    18|      20|          2|
|Paula     |    14|      15|          1|
|Francisco |    16|      15|         -1|
|Angel     |    16|      18|          2|
|Soledad   |    19|      26|          7|
|Luis      |    18|      18|          0|
|Cristina  |    20|      24|          4|
|Laura     |    12|      18|          6|
|Carlos    |    22|      25|          3|
|Carmen    |    15|      19|          4|
|Javier    |    17|      16|         -1|


La media de las diferencias es 2.05 con una desviación estándar de 2,837. Entonces tenemos:

$$
 t = {{\bar{X}_D}\over{s_D\over{\sqrt{n}}}} =  {{2,05}\over{2,837\over{\sqrt{20}}}}=3,231.
$$

Buscando este valor en la tabla de valores críticos con 19 (N-1) grados de libertad vemos que sí podemos rechazar la hipótesis nula y concluir que hay una diferencia estadísticamente significativa entre los resultados de los dos tests.

::: {.example #unnamed-chunk-10 name="Ejemplo en R"}
:
:::

Para reproducir en R lo que hicimos en el ejemplo \@ref(exm:dependent-t-test-example) tenemos que tener sumo cuidado con el ingreso de los datos. Ya que hay dos observaciones por estudiante lo más conveniente es ponerlos en un ```data.frame```. Vamos a incluir los nombres de los estudiantes, si bien no son necesarios para el cálculo sirve mantener la referencia para poder verificar el correcto ingreso de los datos con los tests. Vamos a ingresar los datos *a mano* aunque en la práctica seguramente se leyera de un archivo externo de R. Usamos la función ```t.test``` con un paramertro adiciónal ```paired=TRUE``` para avisar que son datos pareados.


```r
# Ingresamos los datos
 datos.pre.post = data.frame(
   Nombre = c('Luis', 'Javier', 'Pedro', 'Soledad', 'Manuel', 'Cecilia', 'Cristina', 'Angel', 'Manuela', 'José', 'Juan', 'Antonio', 'Carmen', 'Carlos ', 'Francisco', 'Miguel', 'Laura', 'Lucía', 'Paula', 'Dolores'),
   Pre = c(18, 21, 16, 22, 19, 24, 17, 21, 23, 18, 14, 16, 16, 19, 18, 20, 12, 22, 15, 17),
   Post = c(22, 25, 17, 24, 16, 29, 20, 23, 19, 20, 15, 15, 18, 26, 18, 24, 18, 25, 19, 16)
 )

# Verificamos la homogeneidad de varianzas
var.test(datos.pre.post$Pre,datos.pre.post$Post)
```

```
#> 
#> 	F test to compare two variances
#> 
#> data:  datos.pre.post$Pre and datos.pre.post$Post
#> F = 0.60329, num df = 19, denom df = 19, p-value =
#> 0.2795
#> alternative hypothesis: true ratio of variances is not equal to 1
#> 95 percent confidence interval:
#>  0.238790 1.524186
#> sample estimates:
#> ratio of variances 
#>          0.6032913
```

```r
# Verificamos que los datos tienen distribución normal
shapiro.test(datos.pre.post$Pre)
```

```
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  datos.pre.post$Pre
#> W = 0.98197, p-value = 0.9569
```

```r
shapiro.test(datos.pre.post$Post)
```

```
#> 
#> 	Shapiro-Wilk normality test
#> 
#> data:  datos.pre.post$Post
#> W = 0.94235, p-value = 0.2654
```

```r
# Realizamos prueba t

t.test(datos.pre.post$Post,datos.pre.post$Pre, paired = TRUE)
```

```
#> 
#> 	Paired t-test
#> 
#> data:  datos.pre.post$Post and datos.pre.post$Pre
#> t = 3.2313, df = 19, p-value = 0.004395
#> alternative hypothesis: true difference in means is not equal to 0
#> 95 percent confidence interval:
#>  0.7221251 3.3778749
#> sample estimates:
#> mean of the differences 
#>                    2.05
```

Vemos que el resultado tiene significanza estadística alta ($p\leqslant0,01$). El cálculo de R también nos da un intervalo de confianza al 95%. 

## Prueba de z

Existe también una prueba, llamada *de z*, que se puede usar para muestras más grandes. Se basa en el hecho de que cuando las muestras son más grandes tienden a una distribución normal y no una distribución t. Aparte de eso su concepto y mecánica es similar a la de la prueba t. Puede aplicarse cuando las muestras tienen más de 30 (N>30) observaciones y  la principal diferencia de que es capaz de detectar diferencias más pequeñas en los datos lo que reduce el riesgo de un error tipo II.



## Resumen de procedimiento

La figura \@ref(fig:flow-chart-test-selection) despliega un diagrama de flujo para eligir un test estadístico inferencial.

<div class="figure">
<img src="07-tests-parametricos_files/figure-html/flow-chart-test-selection-1.png" alt="Diagrama de flujo para selección de estadística inferencial" width="672" />
<p class="caption">(\#fig:flow-chart-test-selection)Diagrama de flujo para selección de estadística inferencial</p>
</div>


## Glosario

Error estándar de diferencias entre medias  
:    El error estándar calculado sobre la distribución de diferencias entre dos muestras. 
    Fórmula: $SED = \sqrt{\sigma^2_1/N_1 + \sigma^2_1/N_2}$ 
    Equivalente en inglés: «Standar error of differences (SED)». 

Prueba de Fisher 
:    Prueba estadística que nos permite estimar si la varianza de dos muestras en similar. 
    Equivalente en inglés: «Fisher test». 

Prueba de Shapiro-Wilks 
:    Prueba estadística que nos permite estimar en qué medida una muestra proviene de una distribución normal. 
    Equivalente en inglés: «Shapiro-Wilks Test». 

Prueba de z 
:    Prueba estadística que nos permite estimar si dos muestras grandes (N>30 para ambas) provienen de poblaciones diferentes. 
    Equivalente en inglés: «z-test». 

Prueba t para muestras independientes 
:    Test estadístico que nos indica si la media de dos muestras tienen más diferencias de lo que se esperaría si son aleatorias. 
    Fórmula: $t = {{(\bar{x_1}-\bar{x_2})}\over{SED}}$ 
    Función relevante en R: ```t.test```. 
    Equivalente en inglés: «T-test for independent samples». 

Prueba t para muestras pareadas 
:    Test estadístico que nos indica si la media de dos muestras correlacionadas tienen más diferencias de lo que se esperaría por razones aleatorias. 
    Fórmula: $t = {{\bar{X}_D}\over{s_D\over{\sqrt{n}}}}$ 
    Función relevante en R: ```t.test```. 
    Equivalente en inglés: «T-test for dependent samples». 
