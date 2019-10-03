import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> peliculas;

  CardSwiper({
    @required this.peliculas
  });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size; 

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: new Swiper(
        
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,));
        },
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: 3,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}