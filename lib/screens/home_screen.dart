import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widgets/header_widgets.dart';
import 'package:weather_app/widgets/hourly_data_widget.dart';

import '../widgets/current_weather_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  //Get.put yaşam döngüsü boyunca globalcontrollerin aktif olmasını sağlar.
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(height: 20),
                      const HeaderWidget(),
                      // for our current temp ('current')
                      CurrentWeatherWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                      const SizedBox(height: 5),
                      HourlyDataWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather(),
                      ),
                    ],
                  ),
                ))),
    );
  }
}
