// Captura de elementos del DOM
const num1Input = document.getElementById('num1');
const num2Input = document.getElementById('num2');
const operationSelect = document.getElementById('operation');
const btnExecute = document.getElementById('btnExecute');
const resultInput = document.getElementById('result');

// Funciones para cada operación básica
function sumar(a, b) {
    return a + b;
}

function restar(a, b) {
    return a - b;
}

function multiplicar(a, b) {
    return a * b;
}

function dividir(a, b) {
    if (b === 0) {
        return 'Error: División por cero';
    }
    return a / b;
}

// Función principal de cálculo y validaciones
function calcular() {
    const val1 = num1Input.value.trim();
    const val2 = num2Input.value.trim();
    const operation = operationSelect.value;

    // Validación de campos vacíos
    if (val1 === '' || val2 === '') {
        alert('Por favor, ingrese ambos números.');
        return;
    }

    if (!operation) {
        alert('Por favor, seleccione una operación.');
        return;
    }

    // Conversión de tipos de datos
    const num1 = parseFloat(val1);
    const num2 = parseFloat(val2);

    let resultado;

    // Ejecución según la opción seleccionada
    switch (operation) {
        case 'suma':
            resultado = sumar(num1, num2);
            break;
        case 'resta':
            resultado = restar(num1, num2);
            break;
        case 'multiplicacion':
            resultado = multiplicar(num1, num2);
            break;
        case 'division':
            resultado = dividir(num1, num2);
            break;
        default:
            resultado = 'Operación no válida';
    }

    // Muestra del resultado en el DOM
    resultInput.value = resultado;
}

// Asignación de evento al botón
btnExecute.addEventListener('click', calcular);