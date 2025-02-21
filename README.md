# 📷 Ejercicio 1: Cámara en Flutter  

Este proyecto es una aplicación en Flutter que permite capturar imágenes utilizando la cámara del dispositivo. Se han integrado múltiples funcionalidades como el cambio de cámara (frontal/trasera), activación/desactivación del flash y la visualización de la última foto tomada.  

---  

## 📌 **Funcionalidades Implementadas**  

- 📸 **Captura de imágenes** utilizando la cámara del dispositivo.  
- 🔄 **Cambio entre la cámara frontal y trasera**.  
- 💡 **Activación y desactivación del flash**.  
- 🖼️ **Visualización de la última imagen capturada**.  
- 🧭 **Navegación entre diferentes pantallas (Cámara, Galería, Audio)**.  

---  

## 🏗 **Componentes Utilizados**  

| **Componente**     | **Descripción** |
|--------------------|----------------|
| `CameraController` | Controla la cámara del dispositivo. |
| `FutureBuilder` | Muestra la vista de la cámara cuando está lista. |
| `FloatingActionButton` | Botón para capturar una foto. |
| `BottomNavigationBar` | Barra inferior para navegar entre pantallas. |
| `Image.memory` | Muestra la última imagen capturada. |

---  

## 📦 **Dependencias Utilizadas**  

Para el funcionamiento de la cámara y el almacenamiento de imágenes, se han agregado las siguientes dependencias en `pubspec.yaml`:  

```yaml
dependencies:
  flutter:
    sdk: flutter
  camera: ^0.10.5+5
  path_provider: ^2.1.2
# 🖼 **Ejercicio 2: Galería de Imágenes en Flutter**  

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


# 🎵 **Ejercicio 3: Reproducción de Audio en Flutter**  

Este ejercicio amplía la funcionalidad de la aplicación multimedia en Flutter, permitiendo la reproducción de audio con controles básicos como **play, pause y barra de progreso**. Se ha utilizado el paquete `audioplayers` para gestionar el audio y se ha integrado con la barra de navegación inferior para cambiar entre las pantallas de **Cámara, Galería y Audio**.  

---  

## 📌 **Funcionalidades Implementadas**  

- ▶️ **Reproducir y pausar** una canción almacenada en `assets`.  
- ⏩ **Controlar el progreso** de la canción con un `Slider`.  
- ⏳ **Mostrar duración y posición actual** de la pista de audio.  
- 🔊 **Ajustar el volumen** del audio (opcional).  
- 🧭 **Navegación entre pantallas** mediante la barra inferior.  

---  

## 🏗 **Componentes Utilizados**  

| **Componente**        | **Descripción** |
|----------------------|----------------|
| `AudioPlayer`       | Controla la reproducción de audio. |
| `Slider`           | Permite ajustar la posición en la canción. |
| `Text`             | Muestra el nombre de la canción y el tiempo actual. |
| `IconButton`       | Botón de **Play/Pause**. |
| `BottomNavigationBar` | Barra de navegación entre pantallas. |

---  

## 📦 **Dependencias Utilizadas**  

Se ha agregado el paquete `audioplayers` para gestionar la reproducción de audio.  

```yaml
dependencies:
  flutter:
    sdk: flutter
  audioplayers: ^5.2.1
Para cargar la canción desde assets, es necesario declararla en pubspec.yaml:

yaml
Copy
Edit
flutter:
  assets:
    - assets/rosas.mp3
Copy
Edit
