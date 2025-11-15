# CALCULADORA-_PSEINT
ESTA CALCULADORA FUE HECHA CON EL PROPOSITO DE UN PROYECTO UNIVERSITARIO
#  Calculadora Multifuncional en PSeInt



## 🎯 1. Qué Hicimos (Descripción del Proyecto)

Este proyecto es una **Calculadora Multifuncional** desarrollada completamente en PSeInt como parte de la Optativa de Programación. El objetivo principal no era solo crear un programa funcional, sino también demostrar buenas prácticas de programación, incluyendo código limpio, modularidad y documentación exhaustiva.

La calculadora va más allá de operaciones simples y agrupa varias herramientas útiles en un solo programa, sirviendo como una demostración de lógica de programación estructurada y manejo de errores.

### ✨ Características Principales

El programa cuenta con un menú principal interactivo que permite al usuario elegir entre cuatro módulos distintos:

1.  **Operaciones Básicas:** Realiza sumas, restas, multiplicaciones y divisiones, con validación para evitar la división por cero.
2.  **Cálculo de Áreas:** Calcula el área y diámetro/perímetro de cuatro figuras geométricas (Círculo, Cuadrado, Triángulo y Trapecio), validando entradas no negativas.
3.  **Estadísticas Básicas:** Permite al usuario ingresar una serie de números y calcula la **Media** (promedio), **Mediana** (valor central) y **Moda** (valor más frecuente, con soporte multimodal).
4.  **Sucesión de Fibonacci:** Valida si un número pertenece a la sucesión y, de ser así, genera la cantidad de términos que el usuario solicite a partir de ese número.

---

## 🏗️ 2. Cómo lo Hicimos (Arquitectura y Lógica)

La arquitectura del proyecto se basa en la **programación modular** utilizando `SubProcesos` (equivalentes a funciones) en PSeInt.

1.  **Algoritmo Principal (`Algoritmo CalculadoraMultifuncional`):**
    * Su única responsabilidad es mostrar el menú principal.
    * Utiliza un bucle `Repetir...Hasta Que` para mantener al usuario en el programa hasta que elija la opción "Salir".
    * Emplea una estructura `Segun...Hacer` (similar a un `switch`) para invocar al `SubProceso` correspondiente a la opción elegida por el usuario.

2.  **Modularización (`SubProcesos`):**
    * Toda la lógica de negocio está encapsulada en `SubProcesos`.
    * **Ejemplo:** `MenuBasicas()`, `MenuAreas()`, `MenuEstadisticas()`, `MenuFibonacci()`.
    * **Ventaja:** Esto hace que el código principal sea limpio y fácil de leer. Si hay un error en el cálculo de áreas, sabemos que el problema está *solo* dentro de `SubProceso MenuAreas`.

3.  **Módulo de Estadísticas (El más complejo):**
    * Este módulo fue refactorizado para usar **funciones auxiliares**, demostrando una arquitectura más avanzada.
    * `MenuEstadisticas` actúa como "orquestador" y llama a funciones más pequeñas con responsabilidades únicas:
        * `LeerNumeros()`: Recibe el arreglo y lo llena.
        * `CalcularMedia()`: Recorre el arreglo y devuelve la media.
        * `OrdenarVector()`: Ordena el arreglo (necesario para mediana y moda).
        * `CalcularMediana()`: Aplica la lógica de par/impar sobre el arreglo ordenado.
        * `EncontrarMaxFrecuencia()` y `ListarModas()`: Dos funciones que trabajan juntas para encontrar la(s) moda(s) de forma correcta, incluso en casos multimodales.

---

## Purpose 3. Para Qué lo Hicimos (Propósito de cada Módulo)

Cada módulo fue diseñado para cumplir un propósito específico y demostrar diferentes conceptos de programación.

* **`MenuBasicas` (Propósito: Lógica condicional simple)**
    * Demuestra el uso de `Segun...Hacer` para operaciones y el uso de `Si...Sino` para la validación crítica de la **división por cero**.

* **`MenuAreas` (Propósito: Constantes y validación de entradas)**
    * Demuestra la validación de entradas (ej. `Si radio >= 0 Entonces...`) para asegurar que el programa no falle con datos ilógicos.
    * Muestra el uso de la constante `PI` integrada en PSeInt.

* **`MenuEstadisticas` (Propósito: Manejo de Arreglos y Algoritmos)**
    * Este es el módulo más robusto. Su propósito es demostrar el manejo de colecciones de datos (vectores/arreglos).
    * **Media:** Algoritmo simple de acumulación y división.
    * **Mediana:** Demuestra la importancia de un algoritmo de **ordenamiento** (usamos el método de Burbuja en `OrdenarVector`) antes de poder aplicar la lógica condicional (`Si n MOD 2 = 0...`) para encontrar el centro.
    * **Moda:** Es el algoritmo más complejo. Se separó en dos pasos para ser más robusto: primero encontrar la frecuencia *más alta*, y luego recorrer el arreglo una segunda vez para listar *todos* los números que tengan esa frecuencia.

* **`MenuFibonacci` (Propósito: Algoritmos de Bucle y Validación)**
    * Su propósito es doble:
    1.  **Validación:** Demuestra un bucle `Mientras` que comprueba si el número inicial del usuario *realmente pertenece* a la sucesión.
    2.  **Generación:** Demuestra un bucle `Para` que genera `n` términos de la serie usando la lógica simple de `temp <- a + b`.

---

## 🛠️ 4. Dificultades Encontradas (y Cómo las Resolvimos)

Durante el desarrollo, nos encontramos con varios errores comunes de PSeInt que requirieron depuración y refactorización.

* **Dificultad 1: Error de "Subíndice fuera de rango"**
    * **Problema:** El Módulo de Estadísticas fallaba al intentar acceder a `numeros[0]`.
    * **Solución:** Descubrimos que nuestro perfil de PSeInt estaba configurado para que los **arreglos empiecen en el índice 1, no en 0**. Tuvimos que refactorizar todos los bucles `Para`, los accesos al arreglo, y la lógica de la mediana/moda para que funcionara con una base 1 (ej. `Para i <- 1 Hasta n`).

* **Dificultad 2: Error "Falta cerrar SI" (Error Fantasma)**
    * **Problema:** PSeInt reportaba `ERROR 117: Falta cerrar SI` al final de varios SubProcesos, aunque la estructura `Si...FinSi` era visiblemente correcta.
    * **Solución:** El problema real era que PSeInt (en modo estricto) **no permite usar `Definir` dentro de bucles o condicionales**. Movimos *todas* las declaraciones `Definir` al inicio de cada `SubProceso`, solucionando el error.

* **Dificultad 3: Error "Identificador no válido (PI)"**
    * **Problema:** El programa fallaba al intentar definir la constante `PI` en `MenuAreas`.
    * **Solución:** PSeInt ya incluye `PI` como una constante global. La solución fue simple: **eliminar** las líneas `Definir PI...` y `PI <- ...` y usar `PI` directamente en la fórmula.

* **Dificultad 4: Error "Debe haber un Algoritmo"**
    * **Problema:** El programa no se ejecutaba y marcaba un error en la Línea 1.
    * **Solución:** Nuestro perfil de PSeInt requería que el programa principal comenzara con la palabra `Algoritmo` y terminara con `FinAlgoritmo`, en lugar de `Proceso` y `FinProceso`.

* **Dificultad 5: Lógica de Fibonacci Compleja**
    * **Problema:** La lógica original para "reajustar" las variables `a` y `b` en Fibonacci era confusa y propensa a errores.
    * **Solución:** **Refactorizamos el módulo**. La nueva versión es más limpia: primero valida que el número existe (dejando `a` y `b` listos en la posición correcta) y luego un segundo bloque `Si` se encarga *solo* de la generación, sin reajustes complejos.
