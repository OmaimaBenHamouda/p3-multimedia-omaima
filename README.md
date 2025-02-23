# 📷 Ejercicio 1

Este proyecto es una aplicación en Flutter que permite capturar imágenes utilizando la cámara del dispositivo. Se han integrado múltiples funcionalidades como el cambio de cámara (frontal/trasera), activación/desactivación del flash y la visualización de la última foto tomada.

---

## 📌 **Prompt**  

Quiero una aplicación Flutter que cree tres pantallas: Pantalla1, Pantalla2 y Pantalla3.
Pantalla 1 (Cámara)
Arriba tiene una barra con el título "Cámara" en el centro.
Debajo, se muestra la cámara en tiempo real  en la que puedo verme.
Luego, hay un botón para tomar una foto.
En la parte inferior, hay una barra con tres iconos representando: Cámara, Imagen y Audio.
Al hacer clic en el icono de Cámara, me quedo en la misma pantalla.
Al hacer clic en el icono de Imagen, se abre la Pantalla2.
Al hacer clic en el icono de Audio, se abre la Pantalla3.
Pantalla 2 (Imagen)
Arriba tiene una barra con el título "Imagen" en el centro.
En el medio, se muestra una galería de fotos.
En la parte inferior, hay una barra con tres iconos representando: Cámara, Imagen y Audio.
Al hacer clic en el icono de Cámara, se abre la Pantalla1.
Al hacer clic en el icono de Imagen, me quedo en la misma pantalla.
Al hacer clic en el icono de Audio, se abre la Pantalla3.
Pantalla 3 (Audio)
Arriba tiene una barra con el título "Audio" en el centro.
En el medio, hay:
Una lista de canciones.
Un botón para pausar el audio.
Una barra de ajuste de volumen o progreso.
En la parte inferior, hay una barra con tres iconos representando: Cámara, Imagen y Audio.
Al hacer clic en el icono de Cámara, se abre la Pantalla1.
Al hacer clic en el icono de Imagen, se abre la Pantalla2.
Al hacer clic en el icono de Audio, me quedo en la misma pantalla.

dame por separado el código para cada pantalla 


---

## 📌 **Funcionalidades Implementadas**  

- 📸 **Captura de imágenes** utilizando la cámara del dispositivo.  
- 🔄 **Cambio entre la cámara frontal y trasera**.  
- 💡 **Activación y desactivación del flash**.  
- 🖼️ **Visualización de la última imagen capturada**.  
- 🧭 **Navegación entre diferentes pantallas** (Cámara, Galería, Multimedia).  

---

## 📦 **Dependencias Utilizadas**  

Para el funcionamiento de la cámara y el almacenamiento de imágenes, se han agregado las siguientes dependencias en el archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  camera: ^0.10.5+5
  path_provider: ^2.1.2
```

---  
![Screenshot_2025-02-21-20-30-20-89_be527eb5f8f93f23d7180e260bd2860d](https://github.com/user-attachments/assets/37ec7a39-cfce-47d0-adb5-ce6e47df670c)

# 🖼 Ejercicio 2: Galería de Imágenes en Flutter 

Este proyecto amplía la funcionalidad de la aplicación de cámara en Flutter, permitiendo almacenar las fotos capturadas y mostrarlas en una galería dentro de la aplicación. Se ha utilizado `shared_preferences` para guardar las rutas de las imágenes y mantener la galería persistente.  

---  

## 📌 **Funcionalidades Implementadas**  

- 📸 **Captura y almacenamiento de imágenes** en el dispositivo.  
- 🖼️ **Visualización de todas las imágenes capturadas** en una galería.  
- 💾 **Persistencia de las imágenes** utilizando `shared_preferences`.  
- 🔄 **Actualización automática de la galería** tras tomar una foto.  
- 🧭 **Navegación entre la Cámara y la Galería**.  

---  

## 🏗 **Componentes Utilizados**  

| **Componente**         | **Descripción** |
|------------------------|----------------|
| `GridView.builder`     | Muestra las imágenes en formato de cuadrícula. |
| `Image.file`          | Carga y muestra las imágenes almacenadas. |
| `SharedPreferences`   | Guarda las rutas de las imágenes de forma persistente. |
| `FloatingActionButton` | Botón para volver a la cámara y capturar nuevas imágenes. |

---  

## 📦 **Dependencias Utilizadas**  

Para gestionar el almacenamiento y la visualización de imágenes, se ha agregado la siguiente dependencia en `pubspec.yaml`:  

```yaml
dependencies:
  shared_preferences: ^2.2.2
```
![Screenshot_2025-02-23-19-39-14-30_be527eb5f8f93f23d7180e260bd2860d](https://github.com/user-attachments/assets/d3b4306d-0e32-4d0c-96b5-b7599e55309b)


# 🎵 Ejercicio 3: Reproducción de Audio en Flutter  

Este ejercicio amplía la funcionalidad de la aplicación multimedia en Flutter, permitiendo la reproducción de audio con controles básicos como **play, pause y barra de progreso**. Se ha utilizado el paquete `audioplayers` para gestionar el audio y se ha integrado con la barra de navegación inferior para cambiar entre las pantallas de **Cámara, Galería y Audio**.  

---  

## 📌 Funcionalidades Implementadas

- ▶️ **Reproducir y pausar** una canción almacenada en `assets`.  
- ⏩ **Controlar el progreso** de la canción con un `Slider`.  
- ⏳ **Mostrar duración y posición actual** de la pista de audio.  
- 🔊 **Ajustar el volumen** del audio (opcional).  
- 🧭 **Navegación entre pantallas** mediante la barra inferior.  

---  

## 🏗 Componentes Utilizados

| **Componente**        | **Descripción** |
|----------------------|----------------|
| `AudioPlayer`       | Controla la reproducción de audio. |
| `Slider`           | Permite ajustar la posición en la canción. |
| `Text`             | Muestra el nombre de la canción y el tiempo actual. |
| `IconButton`       | Botón de **Play/Pause**. |
| `BottomNavigationBar` | Barra de navegación entre pantallas. |

---  

## 📦 Dependencias Utilizadas

Se ha agregado el paquete `audioplayers` para gestionar la reproducción de audio.  

```yaml
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^5.2.1
Para cargar la canción desde assets, es necesario declararla en pubspec.yaml:

yaml

flutter:
  assets:
    - assets/rosas.mp3
```
![Screenshot_2025-02-21-20-22-26-67_be527eb5f8f93f23d7180e260bd2860d](https://github.com/user-attachments/assets/50c321c1-36b5-480b-b50d-ba3dc7b720f1)


# 🔌 APIs Utilizadas

Este proyecto utiliza varias APIs de Flutter para capturar imágenes, almacenarlas y reproducir audio. A continuación, se describen las APIs y cómo se han implementado en la aplicación.

## 📷 API de Cámara (`camera`)

Se ha utilizado el paquete [`camera`](https://pub.dev/packages/camera) para acceder a la cámara del dispositivo y capturar imágenes.

### 🔹 Principales Métodos Utilizados:
- **`availableCameras()`** → Devuelve una lista de cámaras disponibles en el dispositivo.
- **`CameraController()`** → Controla la cámara (inicialización, configuración y captura).
- **`initialize()`** → Inicializa la cámara seleccionada.
- **`takePicture()`** → Captura una foto y la guarda en el dispositivo.
- **`dispose()`** → Libera los recursos de la cámara cuando ya no se usa.

## 🖼 API de Almacenamiento (`shared_preferences`)

Para guardar y recuperar imágenes de forma persistente, se ha utilizado [`shared_preferences`](https://pub.dev/packages/shared_preferences). Esto permite almacenar las rutas de las imágenes capturadas para visualizarlas en la galería.

### 🔹 Principales Métodos Utilizados:
- **`SharedPreferences.getInstance()`** → Obtiene una instancia del almacenamiento local.
- **`setStringList('images', rutasImagenes)`** → Guarda la lista de rutas de imágenes.
- **`getStringList('images')`** → Recupera la lista de imágenes almacenadas.
- **`remove('images')`** → Borra todas las imágenes guardadas.

## 🎵 API de Reproducción de Audio (`audioplayers`)

Para la reproducción de audio, se ha utilizado [`audioplayers`](https://pub.dev/packages/audioplayers), un paquete que permite reproducir sonidos y música en Flutter.

### 🔹 Principales Métodos Utilizados:
- **`AudioPlayer()`** → Crea una instancia del reproductor de audio.
- **`play('assets/rosas.mp3')`** → Reproduce una canción almacenada en los assets.
- **`pause()`** → Pausa la reproducción de la canción.
- **`resume()`** → Reanuda la reproducción.
- **`seek(Duration(seconds: x))`** → Mueve la reproducción a un punto específico.
- **`onDurationChanged.listen((Duration d))`** → Escucha cambios en la duración del audio.
- **`onPositionChanged.listen((Duration p))`** → Escucha cambios en la posición actual del audio.

---

# 📥 Uso del APK en Android

Para probar la aplicación en un dispositivo Android, sigue estos pasos:

1. **Generar el APK:**  
   Ejecuta el siguiente comando en la terminal de tu proyecto Flutter:
   ```sh
   flutter build apk
