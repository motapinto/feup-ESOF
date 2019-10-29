//Save and read data of user preferences
import 'package:shared_preferences/shared_preferences.dart';

Future readFavourites(String index) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*fav:$index*";
  return favs.getString(key) ?? "0";
}

Future writeFavourites(String index, String value) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*fav:$index*";
  return await favs.setString(key, value);
}

// saveMode = {DarkM ; ...}
Future readSettings(String saveMode, String index) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*$saveMode:$index*";
  return favs.getString(key) ?? "0";
}

// saveMode = {DarkM ; ...}
Future writeSettings(String saveMode, String index, String value) async {
  final favs = await SharedPreferences.getInstance();
  final key = "*$saveMode:$index*";
  return await favs.setString(key, value);
}
