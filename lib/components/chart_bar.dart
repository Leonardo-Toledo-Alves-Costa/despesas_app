import 'package:flutter/material.dart';
import 'chart.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.label, this.percentage, this.value});

  final String label;
  final double? percentage;
  final double? value;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value?.toStringAsFixed(2)}'),
        SizedBox(height: 5,),
        Container(
          height: 50,
          width: 10,
          child: Stack(),
        ),
        SizedBox(height: 5,),
        Text(label)
      ],
    );
  }
}