import 'package:shared_preferences/shared_preferences.dart'; // Importamos la librería para el almacenamiento de preferencias compartidas

class ImageStorage {
  static const String key = "saved_images"; // Clave utilizada para almacenar la lista de imágenes en SharedPreferences

  // Método para guardar la ruta de una imagen en las preferencias compartidas
  static Future<void> savePhoto(String imagePath) async {
    final prefs = await SharedPreferences.getInstance(); // Obtenemos la instancia de SharedPreferences
    List<String> images = prefs.getStringList(key) ?? []; // Cargamos la lista existente de imágenes o inicializamos una lista vacía si no existe
    images.add(imagePath); // Agregamos la nueva imagen a la lista
    await prefs.setStringList(key, images); // Guardamos la lista actualizada en SharedPreferences
  }

  // Método para cargar todas las imágenes almacenadas en las preferencias compartidas
  static Future<List<String>?> loadPhotos() async {
    final prefs = await SharedPreferences.getInstance(); // Obtenemos la instancia de SharedPreferences
    return prefs.getStringList(key); // Retornamos la lista de imágenes almacenadas o null si no hay ninguna
  }
}
