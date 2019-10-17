import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http; //el as http es opcional
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  //definir variables y constantes 
  final _apiKey = '5ade90e838d626309a0d5a88fc64ef80';
  final _url = 'api.themoviedb.org';
  final _language = 'es-ES';
  int _pagePopular = 0;
  bool _cargando = false;

  List<Pelicula> _populares = List();

  //con el broadcast, puedo tener mas de un widget escuchando este stream.
  final _popularsStreamController = new StreamController<List<Pelicula>>.broadcast();

  //def de gets para el patrón block.
  Function(List<Pelicula>) get popularesSink => _popularsStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularsStreamController.stream;

  //definición de métodos

  //metodo auxiliar para hacer las apicalls.
  Future<List<Pelicula>> _proccessMovie(Uri url) async {

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.peliculas;
  }

  //obtiene las pelis en cine
  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apiKey,
      'language' : _language
    });

    return await _proccessMovie(url);
  }

  //
  Future<List<Pelicula>> getPopulares() async {

    if (_cargando) return [];
    _cargando = true;
    _pagePopular++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apiKey,
      'language'  : _language,
      'page'      : _pagePopular.toString()
    });
    
    final resp = await _proccessMovie(url);

    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    
    return resp;
  }

   void disposeStreams() {
    _popularsStreamController?.close(); 
  }
}