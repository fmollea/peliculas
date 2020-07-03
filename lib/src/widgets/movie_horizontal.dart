import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  MovieHorizontal( {@required this.peliculas, @required this.siguientePagina });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
        if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 150) {
          siguientePagina();
        }
    });  

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i) => _tarjeta(context, peliculas[i])
      ),
    );
  }

  Widget _tarjeta (BuildContext context, Pelicula pelicula) {

    final _screenSize = MediaQuery.of(context).size;

    final _tarjetaContainer = Container(
        margin: EdgeInsets.only(right: 8.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.contain,
                height: _screenSize.height * 0.20 ,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              pelicula.title,
              style: Theme.of(context).textTheme.caption,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );

    return GestureDetector(
      child: _tarjetaContainer,
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: pelicula);
      },
    );
  }

//Este método se deja de usar cuando se implementa el page.builder y se crea el método _tarjeta.

  List<Widget> _tarjetas(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return peliculas.map( (pelicula) {

      return Container(
        margin: EdgeInsets.only(right: 8.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.contain,
                height: _screenSize.height * 0.20 ,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              pelicula.title,
              style: Theme.of(context).textTheme.caption,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    }).toList();
  }
}