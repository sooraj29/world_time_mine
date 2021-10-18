import 'package:flutter/material.dart';
import 'package:world_time/world_time_class.dart';

class ChangeLoc extends StatefulWidget {
  const ChangeLoc({Key? key}) : super(key: key);

  @override
  _ChangeLocState createState() => _ChangeLocState();
}

class _ChangeLocState extends State<ChangeLoc> {

  List<World_Class>locations=[
    World_Class(location: 'Johannesburg', flag: 'za', url: 'Africa/Johannesburg'),
    World_Class(location: 'Nairobi', flag: 'ke', url: 'Africa/Nairobi'),
    World_Class(location: 'Buenos Aires', flag: 'ar', url: 'America/Argentina/Buenos_Aires'),
    World_Class(location: 'Chicago', flag: 'us', url: 'America/Chicago'),
    World_Class(location: 'Los Angeles', flag: 'us', url: 'America/Los_Angeles'),
    World_Class(location: 'Rio', flag: 'br', url: 'America/Rio_Branco'),
    World_Class(location: 'Colombo', flag: 'lk', url: 'Asia/Colombo'),
    World_Class(location: 'Kolkata', flag: 'in', url: 'Asia/Kolkata'),
    World_Class(location: 'Kuala Lumpur', flag: 'my', url: 'Asia/Kuala_Lumpur'),
    World_Class(location: 'Shanghai', flag: 'cn', url: 'Asia/Shanghai'),
    World_Class(location: 'Tokyo', flag: 'jp', url: 'Asia/Tokyo'),
    World_Class(location: 'Amsterdam', flag: 'nl', url: 'Europe/Amsterdam'),
    World_Class(location: 'Berlin', flag: 'de', url: 'Europe/Berlin'),
    World_Class(location: 'Brussels', flag: 'be', url: 'Europe/Brussels'),
    World_Class(location: 'Rome', flag: 'it', url: 'Europe/Rome'),
    World_Class(location: 'London', flag: 'gb', url: 'Europe/London'),
    World_Class(location: 'Madrid', flag: 'es', url: 'Europe/Madrid'),
  ];

  void updatetime(index) async{
    World_Class inst = locations[index];
    await inst.getTime();
    Navigator.pop(context,{
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDay': inst.isDay,
    });
  }

  @override
  void initState(){
    super.initState();
    // World_Class instance = World_Class(
    //     location: 'Chicago', flag: 'boom.png', url: 'America/Chicago');
    // await instance.getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            'Choose Location:',
                style: TextStyle(
              color: Colors.grey[50],
          ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child:  Padding(
                padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,2.0),
                child: ListTile(
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/'+locations[index].flag+'.png'),
                  ),
                  onTap: (){updatetime(index);},
                  tileColor: Colors.grey[400],
                  hoverColor: Colors.grey[700],
                ),
              ),
            );
          }),
    );
  }
}
