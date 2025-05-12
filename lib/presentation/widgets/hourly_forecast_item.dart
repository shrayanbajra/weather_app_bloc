import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyForecastItem extends StatelessWidget {
  final DateTime time;
  final double temperature;
  final String sky;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.sky,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat.j().format(time),
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(
              sky == 'Clouds' || sky == 'Rain'
                  ? Icons.cloud
                  : Icons.wb_sunny_rounded,
              size: 32,
              color: Colors.amber,
            ),
            Text(
              '${(temperature - 273.15).toStringAsFixed(0)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
