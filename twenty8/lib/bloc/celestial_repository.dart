import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/celestial_object.dart';

class CelestialRepository {
  Future<List<CelestialObject>> fetchCelestialData() async {
    final response = await http
        .get(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CelestialObject.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load celestial data');
    }
  }
}
