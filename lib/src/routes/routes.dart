import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder> {

  '/'         : (BuildContext context) => HomePage(),
};