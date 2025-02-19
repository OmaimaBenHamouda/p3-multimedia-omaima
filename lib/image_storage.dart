import 'package:shared_preferences/shared_preferences.dart';

class ImageStorage {
  static const String key = "saved_images";

  static Future<void> savePhoto(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> images = prefs.getStringList(key) ?? [];
    images.add(imagePath);
    await prefs.setStringList(key, images);
  }

  static Future<List<String>?> loadPhotos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
}
