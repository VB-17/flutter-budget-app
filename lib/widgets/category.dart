import 'package:flutter/material.dart';
import 'package:flutter_budget_app_ui/helpers/color_helper.dart';
import 'package:flutter_budget_app_ui/screens/category_screen.dart';
import '../models/category_model.dart';

class ExpenseCategory extends StatelessWidget {
  final Category category;
  final double totalAmount;

  ExpenseCategory(this.category, this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(category),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount - totalAmount).toStringAsFixed(2)}/\$${category.maxAmount}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxBarWidth = constraints.maxWidth;
                final double percent =
                    (category.maxAmount - totalAmount) / category.maxAmount;

                double barWidth = percent * maxBarWidth;

                if (barWidth < 0) {
                  barWidth = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey[200],
                      ),
                    ),
                    Container(
                      width: barWidth,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: getColor(context, percent),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
