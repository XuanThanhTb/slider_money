import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Send Data App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send Data', style: TextStyle(color: Colors.black, fontSize: 24),),
          backgroundColor: Colors.yellow,
        ),
        body: SendData(),
      ),
    );
  }
}
class SendData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SendDataState();
  }
}
class SendDataState extends State<SendData>{
  RangeValues values = RangeValues(0, 30000000);
  RangeLabels labels = RangeLabels('1', '100');
  ShowValueIndicator showValueIndicator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(values.start.toInt().toString()),
                Text(values.end.toInt().toString())
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.yellow,
                inactiveTrackColor: Color(0xffE7E7E7),
                trackHeight: 9.0,
                thumbColor: Color(0xffE7E7E7),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayColor: Colors.purple.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
              ),
                child: RangeSlider(
                min: 0,
                max: 30000000,
                values: values,
                labels: labels,
                // divisions: 10,
                onChanged: (value){
                  print('START: ${value.start.toInt()}, START: ${value.end.toInt()}');
                  setState(() {
                    values = value;
                    labels = RangeLabels(value.start.toInt().toString(), value.end.toInt().toString());
                    showValueIndicator = ShowValueIndicator.always;
                  });
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}