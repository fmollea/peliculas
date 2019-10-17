import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({
    @required this.peliculas
  });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size; 

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: new Swiper(
        
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
            )
          );
        },
        itemWidth: _screenSize.width * 0.65,
        itemHeight: _screenSize.height * 0.5,
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}