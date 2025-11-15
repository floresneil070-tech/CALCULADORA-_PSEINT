Proceso CalculadoraMultifuncional
    // Definición de variables para el menú principal
    Definir opcion Como Entero
    
    // Bucle principal del menú
    Repetir
        // LimpiarPantalla // Opcional, descomentar si se desea limpiar la consola en cada iteración
        Escribir "*************************************"
        Escribir "** CALCULADORA MULTIFUNCIONAL (PSeInt) **"
        Escribir "*************************************"
        Escribir "Seleccione una opción:"
        Escribir "  1. Operaciones Básicas"
        Escribir "  2. Cálculo de Áreas Geométricas"
        Escribir "  3. Estadísticas (Media, Mediana, Moda)"
        Escribir "  4. Sucesión de Fibonacci"
        Escribir "  5. Salir"
        Escribir "*************************************"
        Leer opcion
        
        Segun opcion Hacer
            1:
                MenuBasicas()
            2:
                MenuAreas()
            3:
                MenuEstadisticas()
            4:
                MenuFibonacci()
            5:
                Escribir "Gracias por usar la calculadora. ¡Adiós!"
            De Otro Modo:
                Escribir "Opción no válida. Por favor, intente de nuevo."
        FinSegun
        
        Si opcion <> 5 Entonces
            Escribir "Presione [Enter] para continuar..."
            Esperar Tecla
        FinSi
        
    Hasta Que opcion = 5
    
FinProceso

// --- MÓDULO 1: OPERACIONES BÁSICAS ---
SubProceso MenuBasicas
    Definir num1, num2, resultado Como Real
    Definir op_basica Como Entero
    
    Escribir "--- Operaciones Básicas ---"
    Escribir "Ingrese el primer número:"
    Leer num1
    Escribir "Ingrese el segundo número:"
    Leer num2
    
    Escribir "Seleccione la operación:"
    Escribir "  1. Suma (+)"
    Escribir "  2. Resta (-)"
    Escribir "  3. Multiplicación (*)"
    Escribir "  4. División (/)"
    Leer op_basica
    
    Segun op_basica Hacer
        1:
            resultado <- num1 + num2
            Escribir num1, " + ", num2, " = ", resultado
        2:
            resultado <- num1 - num2
            Escribir num1, " - ", num2, " = ", resultado
        3:
            resultado <- num1 * num2
            Escribir num1, " * ", num2, " = ", resultado
        4:
            // Validación para evitar división por cero
            Si num2 = 0 Entonces
                Escribir "Error: No se puede dividir por cero."
            Sino
                resultado <- num1 / num2
                Escribir num1, " / ", num2, " = ", resultado
            FinSi
        De Otro Modo:
            Escribir "Operación no válida."
    FinSegun
FinSubProceso

// --- MÓDULO 2: CÁLCULO DE ÁREAS ---
SubProceso MenuAreas
    Definir op_area Como Entero
    Definir radio, lado, base, altura, baseMayor, baseMenor, area, diametro Como Real
    Definir P1 Como Real
    P1 <- 3.14159265 // Constante PI
    
    Escribir "--- Cálculo de Áreas Geométricas ---"
    Escribir "Seleccione la figura:"
    Escribir "  1. Círculo (calcula área y diámetro)"
    Escribir "  2. Cuadrado"
    Escribir "  3. Triángulo"
    Escribir "  4. Trapecio"
    Leer op_area
    
    Segun op_area Hacer
        1: // Círculo
            Escribir "Ingrese el radio del círculo:"
            Leer radio
            Si radio >= 0 Entonces
                area <- PI * radio^2
                diametro <- 2 * radio
                Escribir "El área del círculo es: ", area
                Escribir "El diámetro del círculo es: ", diametro
            Sino
                Escribir "Error: El radio no puede ser negativo."
            FinSi
        2: // Cuadrado
            Escribir "Ingrese el lado del cuadrado:"
            Leer lado
            Si lado >= 0 Entonces
                area <- lado * lado
                Escribir "El área del cuadrado es: ", area
            Sino
                Escribir "Error: El lado no puede ser negativo."
            FinSi
        3: // Triángulo
            Escribir "Ingrese la base del triángulo:"
            Leer base
            Escribir "Ingrese la altura del triángulo:"
            Leer altura
            Si base >= 0 Y altura >= 0 Entonces
                area <- (base * altura) / 2
                Escribir "El área del triángulo es: ", area
            Sino
                Escribir "Error: La base y la altura no pueden ser negativas."
            FinSi
        4: // Trapecio
            Escribir "Ingrese la base mayor del trapecio:"
            Leer baseMayor
            Escribir "Ingrese la base menor del trapecio:"
            Leer baseMenor
            Escribir "Ingrese la altura del trapecio:"
            Leer altura
            Si baseMayor >= 0 Y baseMenor >= 0 Y altura >= 0 Entonces
                area <- ((baseMayor + baseMenor) * altura) / 2
                Escribir "El área del trapecio es: ", area
            Sino
                Escribir "Error: Las bases y la altura no pueden ser negativas."
            FinSi
        De Otro Modo:
            Escribir "Figura no válida."
    FinSegun
FinSubProceso

// --- MÓDULO 3: ESTADÍSTICAS ---
SubProceso MenuEstadisticas
    Definir n, i, j Como Entero
    Definir suma, media, mediana, aux Como Real
    
    Escribir "--- Estadísticas (Media, Mediana, Moda) ---"
    Escribir "Ingrese la cantidad de números a procesar:"
    Leer n
    
    Si n <= 0 Entonces
        Escribir "Cantidad no válida. Debe ser al menos 1."
    Sino
        // Definir el arreglo (vector)
        Dimension numeros[n]
        
        // 1. Leer los datos
        Escribir "Ingrese los ", n, " números:"
        suma <- 0
        Para i <- 0 Hasta n-1 Hacer // PSeInt flexible permite iniciar en 0 o 1
            Leer numeros[i]
            suma <- suma + numeros[i]
        FinPara
        
        // 2. Calcular Media (Promedio)
        media <- suma / n
        Escribir "--------------------------------"
        Escribir "Resultados Estadísticos:"
        Escribir "Media (Promedio): ", media
        
        // 3. Calcular Mediana (Requiere ordenar el arreglo)
        // Usaremos el método de Burbuja para ordenar
        Para i <- 0 Hasta n-2 Hacer
            Para j <- 0 Hasta n-i-2 Hacer
                Si numeros[j] > numeros[j+1] Entonces
                    aux <- numeros[j]
                    numeros[j] <- numeros[j+1]
                    numeros[j+1] <- aux
                FinSi
            FinPara
        FinPara
        
        // Calcular la mediana del arreglo ordenado
        Si n MOD 2 = 0 Entonces
            // Cantidad par de elementos
            mediana <- (numeros[n/2 - 1] + numeros[n/2]) / 2 // Índices 0-based
        Sino
            // Cantidad impar de elementos
            mediana <- numeros[Trunc(n/2)] // Índice 0-based
        FinSi
        Escribir "Mediana: ", mediana
        
        // 4. Calcular Moda (El número que más se repite)
        // Esta lógica encuentra la primera moda en el arreglo ordenado
        Definir moda Como Real
        Definir maxFrecuencia, frecActual, iModa Como Entero
        
        iModa <- 0
        maxFrecuencia <- 0
        moda <- numeros[0] // Valor por defecto
        
        Mientras iModa < n Hacer
            frecActual <- 1
            // Contar cuántas veces aparece el número actual
            Mientras (iModa + 1 < n) Y (numeros[iModa] = numeros[iModa + 1]) Hacer
                frecActual <- frecActual + 1
                iModa <- iModa + 1
            FinMientras
            
            // Comparar con la frecuencia máxima encontrada
            Si frecActual > maxFrecuencia Entonces
                maxFrecuencia <- frecActual
                moda <- numeros[iModa]
            FinSi
            
            iModa <- iModa + 1
        FinMientras
        
        // Validar si hay moda (si maxFrecuencia es 1, no hay moda)
        Si maxFrecuencia = 1 Y n > 1 Entonces
            Escribir "Moda: No hay moda (todos los números son únicos)."
        Sino
            Escribir "Moda: ", moda, " (aparece ", maxFrecuencia, " veces)"
        FinSi
    FinSi
FinSubProceso

// --- MÓDULO 4: SUCESIÓN DE FIBONACCI ---
// --- MÓDULO 4: SUCESIÓN DE FIBONACCI (CORREGIDO Y SIMPLIFICADO) ---
SubProceso MenuFibonacci
    Definir num_inicial, cant_terminos, i Como Entero
    Definir a, b, temp Como Entero 
    Definir encontrado Como Logico
    
    Escribir "--- Sucesión de Fibonacci ---"
    Escribir "Ingrese el número inicial (debe pertenecer a la sucesión, ej: 0, 1, 2, 3, 5, 8...):"
    Leer num_inicial
    Escribir "Ingrese cuántos términos desea generar (a partir de ese número):"
    Leer cant_terminos
    
    // Validar que el número de términos sea positivo
    Si cant_terminos <= 0 Entonces
        Escribir "Error: La cantidad de términos debe ser positiva."
    Sino
        
        // --- PASO 1: VALIDACIÓN (Simplificada) ---
        // Validar que 'num_inicial' PERTENECE a la sucesión
        a <- 0
        b <- 1
        encontrado <- Falso
        
        Si num_inicial = 0 Entonces
            encontrado <- Verdadero
            // 'a' = 0, 'b' = 1 (listos para generar)
        Sino
            // Avanzamos 'a' hasta que sea igual o mayor que el número inicial
            Mientras a < num_inicial Hacer
                temp <- a + b
                a <- b
                b <- temp
            FinMientras
            
            // Si 'a' es exactamente el número, es válido.
            Si a = num_inicial Entonces
                encontrado <- Verdadero
                // 'a' tiene el número inicial
                // 'b' tiene el siguiente número
            FinSi
        FinSi
        
        // --- PASO 2: GENERACIÓN ---
        Si encontrado = Falso Entonces
            Escribir "Error: El número ", num_inicial, " NO pertenece a la sucesión de Fibonacci."
            Escribir "Recuerde: La sucesión es 0, 1, 1, 2, 3, 5, 8, 13, 21..."
        Sino
            Escribir "Sucesión de Fibonacci generada:"
            
            // El bucle de validación ya dejó 'a' y 'b' listos para la generación.
            // 'a' contiene el número actual (num_inicial)
            // 'b' contiene el siguiente número de la serie
            
            Para i <- 1 Hasta cant_terminos Hacer
                Escribir "Término ", i, ": ", a
                
                // Avanzar la serie para la siguiente iteración
                temp <- a + b
                a <- b
                b <- temp
            FinPara
        FinSi
    FinSi
FinSubProceso
