import 'dart:convert';

class Peliculas {

  List<Pelicula> peliculas = List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final pelicula = Pelicula.fromJsonMap(item);
      peliculas.add(pelicula);
    });
  }
}

class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    popularity        = json['popularity'] / 1;
    voteCount         = json['vote_count'];
    video             = json['video'];
    posterPath        = json['poster_path'];
    id                = json['id'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];
    voteAverage       = json['vote_average'] / 1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];
  }

  String getPosterImg() {

    String url = 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59606710-d544-0136-1d6e-61fd63e82e4' +
      '4/e/0fa64ac0-0314-0137-cf43-1554cd16a871/icons/icon-no-image.svg';
   
    if (posterPath != null) {
      url = 'https://image.tmdb.org/t/p/w500/$posterPath';
    }

    return url;
  }

  String getBackdropPath() {

    String url = 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59606710-d544-0136-1d6e-61fd63e82e4' +
      '4/e/0fa64ac0-0314-0137-cf43-1554cd16a871/icons/icon-no-image.svg';
   
    if (posterPath != null) {
      url = 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }

    return url;
  }
  
}