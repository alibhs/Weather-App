import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/utils/custom_colors.dart';

import '../model/weather_data_hourly.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            "Bugün",
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColors.dividerLine.withAlpha(150))
                ],
                gradient: const LinearGradient(colors: [
                  CustomColors.firstGradientColor,
                  CustomColors.secondGradientColor
                ])),
            child: HourlyDetails(
                temp: weatherDataHourly.hourly[index].temp!,
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!),
          ));
        },
      ),
    );
  }
}

//hourly details class

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  HourlyDetails(
      {Key? key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(temp.toString()),
    );
  }
}
