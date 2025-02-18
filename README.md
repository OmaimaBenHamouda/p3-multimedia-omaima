# 📷 Ejercicio1

Este proyecto es una aplicación en Flutter que permite capturar imágenes utilizando la cámara del dispositivo. Se han integrado múltiples funcionalidades como el cambio de cámara (frontal/trasera), activación/desactivación del flash y la visualización de la última foto tomada.

---

## Prompt

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

---


## 📌 Funcionalidades Implementadas

- 📸 Captura de imágenes utilizando la cámara del dispositivo.
- 🔄 Cambio entre la cámara frontal y trasera.
- 💡 Activación y desactivación del flash.
- 🖼️ Visualización de la última imagen capturada.
- 🧭 Navegación entre diferentes pantallas (Cámara, Galería, Multimedia).

---

## 📦 Dependencias Utilizadas

Para el funcionamiento de la cámara y el almacenamiento de imágenes, se han agregado las siguientes dependencias en el archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  camera: ^0.10.5+5
  path_provider: ^2.1.2


# 📷 Configuración de la Aplicación de Cámara en Flutter

## 📜 Descripción de Dependencias

- **camera**: Proporciona acceso a la cámara del dispositivo y permite capturar imágenes.
- **path_provider**: Facilita el acceso a directorios en el sistema de archivos, lo que permite almacenar las imágenes tomadas.

---

## ⚙️ Configuraciones en Android

Para que la aplicación pueda acceder a la cámara, es necesario agregar los siguientes permisos en el archivo `AndroidManifest.xml`:

📂 **Ruta:** `android/app/src/main/AndroidManifest.xml`

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-feature android:name="android.hardware.camera" />
<uses-feature android:name="android.hardware.camera.autofocus"/>
```

Además, dentro del activity en AndroidManifest.xml, es necesario agregar la siguiente configuración:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:grantUriPermissions="true"
    android:exported="false">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/file_paths"/>
</provider>
```

📂 **Ruta de configuración adicional:** `android/app/src/main/res/xml/file_paths.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <external-files-path name="images" path="Pictures"/>
</paths>
```

---

## 🍏 Configuración en iOS

Para permitir el acceso a la cámara en iOS, se deben agregar permisos en el archivo `Info.plist`:

📂 **Ruta:** `ios/Runner/Info.plist`

```xml
<key>NSCameraUsageDescription</key>
<string>Esta aplicación necesita acceso a la cámara para tomar fotos.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Esta aplicación necesita acceder a la galería para guardar fotos.</string>
```

---

## 🏗️ Modificaciones en build.gradle

Para solucionar conflictos con versiones de NDK en Android, se ha modificado el archivo `android/app/build.gradle.kts` agregando la siguiente línea:

📂 **Ruta:** `android/app/build.gradle.kts`

```kotlin
android {
    ndkVersion = "27.0.12077973"
}
```

Esto asegura que la versión de NDK utilizada sea compatible con todos los plugins requeridos.

---

## 🚀 Ejecución del Proyecto

Para ejecutar la aplicación en un dispositivo o emulador, utiliza los siguientes comandos:

```sh
flutter clean
flutter pub get
flutter run
```

Si deseas generar un APK para probar la aplicación en un dispositivo Android, usa:

```sh
flutter build apk
