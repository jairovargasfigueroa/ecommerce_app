import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static Future<void> setItem(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    // Convertimos todo a String usando jsonEncode
    String jsonString = jsonEncode(value);
    await prefs.setString(key, jsonString);
  }

  static Future<dynamic> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    if (jsonString == null) return null;

    try {
      return jsonDecode(
          jsonString); // Devuelve dynamic (Map, List, String, etc.)
    } catch (e) {
      // Si no es JSON válido, retorna el string directamente
      return jsonString;
    }
  }

  static Future<void> removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
