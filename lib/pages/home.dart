import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;


    String bgImage = data['isDay'] ? 'day.png' : 'night.png';

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 190.0, 0.0, 0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.grey[50],
                    backgroundImage: AssetImage('assets/'+data['flag']+'.png'),
                    radius: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey[50],
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.grey[50],
                    ),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 100.0,
              ),
              ElevatedButton.icon(
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[50],
                  ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[50],
                    ),
                  ),
                onPressed:() async{
                  dynamic result = await Navigator.pushNamed(context,'/change_loc');
                  if(result!=null){
                    setState(() {
                      data={
                        'time': result['time'],
                        'location': result['location'],
                        'isDay': result['isDay'],
                        'flag': result['flag']
                      };
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}