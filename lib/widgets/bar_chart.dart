import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double>? expenses;
  const BarChart({Key? key, this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            )
          ],
        )
      ],
    );
  }
}
