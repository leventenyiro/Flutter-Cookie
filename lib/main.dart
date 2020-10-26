import 'package:flutter/material.dart';

import 'package:mobile/home.dart';
import 'package:mobile/get.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "/",
  routes: {
    "/": (context) => Home(),
    "/get": (context) => Get(),
  },
));