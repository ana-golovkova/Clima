import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

//@override
//Widget build(BuildContext context) {
//  String myMargin = '15';
//  double myMarginAsDouble;
//  try {
//    double myMarginAsDouble = double.parse(myMargin);
//  } catch (e) {
//    print(e);
//  }
//
//  return Scaffold(
//    body: Container(
//      color: Colors.red,
//      margin: EdgeInsets.all(myMarginAsDouble ?? 30),
//    ),
//  );
//}
//}
