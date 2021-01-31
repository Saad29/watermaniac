import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';
import 'package:watermaniac/model/app_state.dart';
import 'package:watermaniac/widgets/shadow/shadow_text.dart';

class MeterPage extends StatefulWidget {
  @override
  _MeterPageState createState() => _MeterPageState();
}

class _MeterPageState extends State<MeterPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        var current = state.glass.currentWaterAmount;
        var target = state.glass.waterAmountTarget;
        var percentage = target > 0 ? current / target * 100 : 100.0;
        var progress = (percentage > 100.0 ? 100.0 : percentage) / 100.0;
        progress = 1.0 - progress;
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
               // Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ShadowText(
                    'IoT Gauge Meters',
                    shadowColor: Colors.black.withOpacity(0.15),
                    offsetX: 3.0,
                    offsetY: 3.0,
                    blur: 3.0,
                    style: TextStyle(
                        color: const Color(0xBEffffff),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                 Spacer(),
                 Row(
                   children: [
                    // Spacer(),
                     Speedometer(
                       size: 100,
                       minValue: 0,
                       maxValue: 100,
                       currentValue: 30,
                       warningValue: 10,
                       backgroundColor: Colors.black,
                      meterColor: Colors.red,
                       warningColor: Colors.lightGreenAccent,
                       kimColor: Colors.purpleAccent,
                       displayNumericStyle: TextStyle(
                           fontFamily: 'Digital-Display',
                           color: Colors.white,
                           fontSize: 18),
                       displayText: 'Sensor 1 Battery',
                       displayTextStyle:
                       TextStyle(color: Colors.white, fontSize: 8),
                     ),
                     Speedometer(
                       size: 100,
                       minValue: 0,
                       maxValue: 100,
                       currentValue: 50,
                       warningValue: 10,
                       backgroundColor: Colors.black,
                       meterColor: Colors.red,
                       warningColor: Colors.lightGreenAccent,
                       kimColor: Colors.purpleAccent,
                       displayNumericStyle: TextStyle(
                           fontFamily: 'Digital-Display',
                           color: Colors.white,
                           fontSize: 18),
                       displayText: 'Sensor 2 Battery',
                       displayTextStyle:
                       TextStyle(color: Colors.white, fontSize: 8),
                     ),
                     Speedometer(
                       size: 100,
                       minValue: 0,
                       maxValue: 100,
                       currentValue: 85,
                       warningValue: 10,
                       backgroundColor: Colors.black,
                       meterColor: Colors.red,
                       warningColor: Colors.lightGreenAccent,
                       kimColor: Colors.purpleAccent,
                       displayNumericStyle: TextStyle(
                           fontFamily: 'Digital-Display',
                           color: Colors.white,
                           fontSize: 18),
                       displayText: 'Sensor 3 Battery',
                       displayTextStyle:
                       TextStyle(color: Colors.white, fontSize: 8),
                     ),
                     Expanded(
                       child: Speedometer(
                         size: 100,
                         minValue: 0,
                         maxValue: 100,
                         currentValue: 69,
                         warningValue: 10,
                         backgroundColor: Colors.black,
                         meterColor: Colors.red,
                         warningColor: Colors.lightGreenAccent,
                         kimColor: Colors.purpleAccent,
                         displayNumericStyle: TextStyle(
                             fontFamily: 'Digital-Display',
                             color: Colors.white,
                             fontSize: 18),
                         displayText: 'Sensor 4 Battery',
                         displayTextStyle:
                         TextStyle(color: Colors.white, fontSize: 8),
                       ),
                     ),
                     //Spacer(),

                   ],

                 ),
                //Spacer(),
                Speedometer(
                  size: 100,
                  minValue: 0,
                  maxValue: 7,
                  currentValue: 3,
                  warningValue: 4,
                  backgroundColor: Colors.black,
                  meterColor: Colors.lightBlueAccent,
                  warningColor: Colors.orange,
                  kimColor: Colors.purpleAccent,
                  displayNumericStyle: TextStyle(
                      fontFamily: 'Digital-Display',
                      color: Colors.white,
                      fontSize: 18),
                  displayText: 'pH Value',
                  displayTextStyle:
                      TextStyle(color: Colors.white, fontSize: 8),
                ),
                //Spacer(),
                Speedometer(
                  size: 200,
                  minValue: 0,
                  maxValue: state.glass.waterAmountTarget,
                  currentValue: state.glass.currentWaterAmount,
                  warningValue: state.glass.waterAmountTarget - 10,
                  backgroundColor: Colors.black,
                  meterColor: Colors.green,
                  warningColor: Colors.red,
                  kimColor: Colors.white,
                  displayNumericStyle: TextStyle(
                      fontFamily: 'Digital-Display',
                      color: Colors.white,
                      fontSize: 40),
                  displayText: 'Water usage in Litres',
                  displayTextStyle:
                      TextStyle(color: Colors.white, fontSize: 15),
                ),
                //Spacer(),
                Speedometer(
                  currentValue: 40,
                  displayText: 'Water Quality',
                  displayTextStyle:
                      TextStyle(color: Colors.white, fontSize: 15),
                ),
               // Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
