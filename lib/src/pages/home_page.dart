import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final provider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    provider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: provider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Populares', style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 8.0),
          StreamBuilder(
              stream: provider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                Widget resultView;

                if (snapshot.hasData) {
                  resultView = MovieHorizontal(
                    peliculas: snapshot.data,
                    siguientePagina: provider.getPopulares
                    );
                } else {
                  resultView = CircularProgressIndicator();
                }

                return resultView;
              },
            ),
        ],
      ),
    );
  }
}