import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.label, this.percentage, this.value});

  final String label;
  final double? percentage;
  final double? value;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('R\$${value?.toStringAsFixed(2)}')
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: 50,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}