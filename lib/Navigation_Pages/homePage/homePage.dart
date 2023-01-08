import 'package:flutter/material.dart';
import 'views/current_airPressure.dart';
import 'views/current_humidity.dart';
import 'views/current_temperature.dart';
import 'views/current_windSpeed.dart';
import 'Services/weather_api_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather/weather.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = (await client.getCurrentWeather('Georgia')) as Weather?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return content();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // ignore: prefer_const_constructors
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          height: 300,
          width: double.infinity,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 500,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 50,
                    color: const Color(0xFF00B050),
                  ),
                  GaugeRange(
                    startValue: 51,
                    endValue: 100,
                    color: const Color(0xFF669900),
                  ),
                  GaugeRange(
                    startValue: 101,
                    endValue: 200,
                    color: const Color(0xFFE5B8B7),
                  ),
                  GaugeRange(
                    startValue: 201,
                    endValue: 300,
                    color: const Color(0xFFFFC000),
                  ),
                  GaugeRange(
                    startValue: 301,
                    endValue: 400,
                    color: const Color(0xFFFF0000),
                  ),
                  GaugeRange(
                    startValue: 401,
                    endValue: 500,
                    color: const Color(0xFFC00000),
                  )
                ],
                // ignore: prefer_const_literals_to_create_immutables
                pointers: <GaugePointer>[
                  const NeedlePointer(
                    value: 340,
                    enableAnimation: true,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: const Text(
                        '340.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  )
                ],
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  currentTemperature(Icons.wb_sunny_rounded,
                      "${data!.temperature}", '${data!.areaName}')
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [currentHumidity(Icons.water, "${data!.humidity}")],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(65, 5, 65, 5),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        // Divider(),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  currentWindSpeed(Icons.wind_power, "${data!.windSpeed}")
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [currentAirPressure(Icons.air, "${data!.pressure}")],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
