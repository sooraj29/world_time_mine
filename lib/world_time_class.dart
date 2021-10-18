import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class World_Class{

  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  World_Class({required this.location,required this.flag,required this.url,this.isDay=true,this.time=''});

  Future<void> getTime() async{
    try{
      var web=Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response=await get(web);
      Map data = jsonDecode(response.body);
      String oper = data['utc_offset'].substring(0,1);
      String hours = data['utc_offset'].substring(1,3);
      String minu = data['utc_offset'].substring(4);
      // print(oper);
      // print(hours);
      // print(minu);
      DateTime _time = DateTime.parse(data['datetime']);
      if(oper=='+')
        _time = _time.add(Duration(hours: int.parse(hours),minutes: int.parse(minu)));
      else if(oper=='-')
        _time = _time.subtract(Duration(hours: int.parse(hours),minutes: int.parse(minu)));
      time=DateFormat.jm().format(_time);
      isDay = _time.hour>6 && _time.hour<18 ? true : false ;
      // print(data);
      // print(time);
    }
    catch(e){
      // print(e);
      time="ERROR Loading Time";
    }
  }

}