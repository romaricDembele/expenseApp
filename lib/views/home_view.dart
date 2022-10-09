import 'package:expenses_app/model/budget_remain.dart';
import 'package:expenses_app/views/interface_observer.dart';
import 'package:expenses_app/views/setting_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  BudgetRemain budgetRemain;

  HomeView({Key? key, required this.budgetRemain}) : super(key: key);
  // HomeView.budget({required this.budgetRemain});

  static const String _title = 'Home View';

  @override
  Widget build(BuildContext context) {
    return HomeStatefullWidget(budgetRemain: budgetRemain);
  }
}

class HomeStatefullWidget extends StatefulWidget {
  BudgetRemain budgetRemain;

  HomeStatefullWidget({Key? key, required this.budgetRemain}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState(budgetRemain: budgetRemain);
}

class _HomeState extends State<StatefulWidget> {
  BudgetRemain budgetRemain;
  _HomeState({required this.budgetRemain});

  @override
  Widget build(BuildContext context) {
    budgetRemain.remainFood.toString();

    return DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Item')),
      DataColumn(label: Text('Allocated money'))
    ], rows: <DataRow>[
      DataRow(cells: <DataCell>[
        const DataCell(Text('Food')),
        DataCell(Text(budgetRemain.remainFood.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Excess cash')),
        DataCell(Text(budgetRemain.excessCash.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Give Away')),
        DataCell(Text(budgetRemain.remainGiveAway.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Investment')),
        DataCell(Text(budgetRemain.remainInvestment.toString()))
      ]),
    ]);
  }
}
