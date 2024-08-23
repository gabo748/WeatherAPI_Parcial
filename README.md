# Aplicación de Clima

Esta es una aplicación desarrollada en Swift que consume la API de [OpenWeatherAPI](https://openweathermap.org/api/one-call-3/) para mostrar los datos del clima basados en coordenadas geográficas (latitud y longitud). La aplicación es capaz de manejar errores de manera eficiente, proporcionando una experiencia de usuario robusta.

## Características

- **Consulta de Clima:** Introduce la latitud y longitud de cualquier ubicación para obtener información detallada del clima.
- **Manejo de Errores:** La aplicación maneja errores comunes, como la falta de conexión a internet o respuestas inesperadas de la API, y proporciona mensajes claros al usuario.

## Requisitos Previos

- **Xcode 12** o superior.
- **Swift 5** o superior.
- Cuenta en [OpenWeatherAPI](https://openweathermap.org/api/one-call-3/) para obtener una clave de API.

## Instalación

1. **Clonar el repositorio:**

    ```bash
    git clone https://github.com/gabo748/WeatherAPI_Parcial.git
    cd WeatherAPI_Parcial
    ```

2. **Abrir el proyecto en Xcode:**

    ```bash
    open WeatherApp.xcodeproj
    ```


3. **Compilar y ejecutar:**

   Selecciona tu simulador o dispositivo y presiona el botón de `Run` en Xcode para compilar y ejecutar la aplicación.

## Uso

1. **Introducir coordenadas:**

   Al iniciar la aplicación, se te pedirá que introduzcas las coordenadas (latitud y longitud) de la ubicación para la cual deseas obtener información del clima.

2. **Ver los resultados:**

   La aplicación mostrará los datos del clima, incluyendo la temperatura, condiciones actuales, y más detalles proporcionados por la API.

3. **Manejo de errores:**

   Si ocurre algún error durante la consulta a la API (por ejemplo, falta de conexión a internet), la aplicación mostrará un mensaje de error apropiado para que el usuario esté informado de la situación.

## Estructura del Proyecto

### Pratron de diseño MVVM

- `Networking`: Manejador de la API que realiza la consulta a WeatherAPI y maneja las respuestas de la API.
- `Model`: Contiene los modelos para poder hacer un mapping de los datos provenientes de la API.
- `Service`: El encargado de hacer las fallas a los endpoints específicos.
- `ViewModel`: El intermediario entre la vista y el modelo.
- `View`: Todos los componentes de UI en el las vistas

## Pruebas de funcionamiento

### Manejo de errores

1. **Coordenadas Invalidas:**
https://github.com/user-attachments/assets/a0857b57-5d29-4f58-b16d-2e1cad9697f5

2. **Error de la API:**
https://github.com/user-attachments/assets/b7054124-f413-4f51-8141-536346819957

### Mostrando  datos correctamente:

1. **Coordenada correctamente:**
https://github.com/user-attachments/assets/711388e8-6a8b-4078-a0bb-cfd9809c54a5

3. **Actualización en tiempo real (cada 30 segundos):
https://github.com/user-attachments/assets/1169c746-b0d8-4bbf-825e-f09f40178ae1


