import 'package:budget_app_ui/helpers/color_helper.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/models/expense_model.dart';
import 'package:budget_app_ui/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category? category;
  const CategoryScreen({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    for (var expense in widget.category!.expenses!) {
      totalAmountSpent += expense.cost!;
    }
    final double amountLeft = widget.category!.maxAmount! - totalAmountSpent;
    final double percent = amountLeft / widget.category!.maxAmount!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.category!.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                    bgColor: Colors.grey.shade200,
                    lineColor: getColor(context, percent),
                    percent: percent,
                    width: 15.0),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/\$${widget.category!.maxAmount!}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
