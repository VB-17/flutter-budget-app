import 'package:flutter/material.dart';
import 'package:flutter_budget_app_ui/data/data.dart';
import 'package:flutter_budget_app_ui/models/category_model.dart';
import 'package:flutter_budget_app_ui/widgets/bar_chart.dart';
import 'package:flutter_budget_app_ui/widgets/category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            forceElevated: true,
            floating: true,
            expandedHeight: 100.0,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Simple Budget"),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                onPressed: () {},
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: BarChart(weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmount = 0.0;
                  category.expenses.forEach(
                    (ex) => {
                      totalAmount += ex.cost,
                    },
                  );
                  return Container(
                    margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ExpenseCategory(categories[index - 1], totalAmount),
                  );
                }
              },
              childCount: 1 + categories.length,
            ),
          )
        ],
      ),
    );
  }
}
