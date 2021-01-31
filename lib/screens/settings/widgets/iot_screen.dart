import 'package:flutter/material.dart';

class IoTScreen extends StatefulWidget {
  @override
  _IoTScreenState createState() => _IoTScreenState();
}

class _IoTScreenState extends State<IoTScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'IoT connection'.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('IoT Server : Raspberry Pi'),
              Spacer(),
              Text('IP Address : 192.168.1.0'),
            ],
          ),
          //Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Signal Strength : Good'),
              Spacer(),
              Text('Status : Connected          '),

            ],
          ),

          RaisedButton(
            color: Colors.blueAccent,
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.white
              ),
            ),

            onPressed: () {},
          )
        ],
      ),
    );
  }
}
