import 'package:expenses_app/model/budget_remain.dart';
import 'package:expenses_app/model/interface_subject.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/views/interface_observer.dart';
import 'package:expenses_app/views/setting_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  BudgetRemain budgetRemain;
  Setting _setting;

  HomeView({Key? key, required this.budgetRemain, required Setting setting})
      : _setting = setting,
        super(key: key);
  // HomeView.budget({required this.budgetRemain});

  static const String _title = 'Home View';

  @override
  Widget build(BuildContext context) {
    return HomeStatefullWidget(
      budgetRemain: budgetRemain,
      setting: _setting,
    );
  }
}

class HomeStatefullWidget extends StatefulWidget {
  BudgetRemain budgetRemain;
  Setting _setting;

  HomeStatefullWidget(
      {Key? key, required this.budgetRemain, required Setting setting})
      : _setting = setting,
        super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _HomeState(budgetRemain: budgetRemain, setting: _setting);
}

class _HomeState extends State<StatefulWidget> implements InterfaceObserver {
  BudgetRemain budgetRemain;
  Setting setting;
  _HomeState({required this.budgetRemain, required this.setting}) {
    budgetRemain.subscribeObserver(this);
    setting.subscribeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    budgetRemain.remainFood.toString();

    return Container(
      alignment: Alignment.center,
      child: DataTable(columns: const <DataColumn>[
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
      ]),
    );
  }

  @override
  void update(InterfaceSubject sett) {
    if (mounted) {
      setState(() {
        setting = sett as Setting;
      });
    }
  }
}
