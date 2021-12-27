import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            //pinned: true,
            expandedHeight: 100,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
              iconSize: 30,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Simple Budget',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: -0.8,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                iconSize: 30,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: BarChart(expenses: weeklySpending),
                );
              },
              childCount: 1 + categories.length,
            ),
          )
        ],
      ),
    );
  }
}