import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/change_loc.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/change_loc':(context) => ChangeLoc(),
  }
));