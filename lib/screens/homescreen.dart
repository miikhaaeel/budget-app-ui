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
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.deepOrange,
                height: 100,
                margin: EdgeInsets.all(10.0),
              );
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
