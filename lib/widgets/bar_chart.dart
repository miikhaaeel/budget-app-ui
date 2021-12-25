import 'package:budget_app_ui/data/data.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double>? expenses;
  const BarChart({Key? key, this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0.0;
    for (var price in expenses!) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    generateBars() {
      List<Bar> bars = [];
      int index = 0;
      for (double item in weeklySpending) {
        bars.add(
          Bar(
            label: daysOfWeek[index],
            amountSpent: item,
            mostExpensive: mostExpensive,
          ),
        );
        index += 1;
      }
      return bars;
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              const Text(
                'Dec 21, 2021 - Dec 27,2021',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: generateBars(),
          )
        ],
      ),
    );
  }
}


class Bar extends StatelessWidget {
  final String? label;
  final double? amountSpent;
  final double? mostExpensive;
  final double _maxBarHeight = 150.0;

  const Bar({Key? key, this.label, this.amountSpent, this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent! / mostExpensive! * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent!.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}