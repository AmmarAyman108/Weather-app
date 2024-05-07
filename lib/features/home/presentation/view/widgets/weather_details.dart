import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/style.dart';
import 'package:weather_app/features/home/data/Models/weather_model.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            ' ${weatherData!.location}',
            style:  Style.textStyle32,
          ),
          Text(
            'Updated: ${weatherData!.date}',
            style: Style.textStyle20,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https:${weatherData!.image}',
              ),
              Text(
                '${weatherData!.temp}ْ',
                style: Style.textStyle40,
              ),
              Column(
                children: [
                  Text(
                    'maxTemp : ${weatherData!.maxTemp}',
                    style: Style.textStyle20,
                  ),
                  Text(
                    'minTemp : ${weatherData!.minTemp}',
                    style: Style.textStyle20,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            '${weatherData!.state}',
            style: Style.textStyle32,
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
