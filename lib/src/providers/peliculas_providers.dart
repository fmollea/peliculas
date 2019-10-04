import 'dart:convert';

import 'package:http/http.dart' as http; //el as http es opcional
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  final _apiKey = '5ade90e838d626309a0d5a88fc64ef80';
  final _url = 'api.themoviedb.org';
  final _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apiKey,
      'language' : _language
    });

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.peliculas;
  }
}