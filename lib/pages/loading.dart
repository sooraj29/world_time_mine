import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/world_time_class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  void setup() async{
    World_Class instance = World_Class(location: 'Kolkata', flag: 'in', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  void initState(){
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SpinKitRipple(
            color: Colors.grey[700],
            size: 80.0,
          ),
          Text(
            'Loading',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
