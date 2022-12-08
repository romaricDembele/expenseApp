import 'package:expenses_app/controller/home_controller.dart';
import 'package:expenses_app/model/interface_subject.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/views/interface_observer.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  HomeController homeController;
  Setting setting;

  ExpenseView({Key? key, required this.homeController, required this.setting})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ExpenseViewState(homeController, setting);
}

class _ExpenseViewState extends State<ExpenseView>
    implements InterfaceObserver {
  late HomeController _homeController;
  late Setting _setting;

  final expenseTypeController = TextEditingController();
  TypeDropdownButton typeDropdownButton = TypeDropdownButton();

  _ExpenseViewState(HomeController homeController, Setting setting) {
    _homeController = homeController;
    _setting = setting;
    _setting.subscribeObserver(this);
  }

  @override
  void dispose() {
    expenseTypeController.dispose();
    super.dispose();
  }

  void _submitForm(String dropdownValue, String text) {
    _homeController.addExpense(dropdownValue, text);
    _homeController.saveExpense(dropdownValue, text);

    // setState(() {});
  }

  Widget _listExpenses() {
    return Expanded(
      child: DataTable(columns: const <DataColumn>[
        DataColumn(label: Text('Item')),
        DataColumn(label: Text('Total expenses'))
      ], rows: <DataRow>[
        DataRow(cells: <DataCell>[
          const DataCell(Text('Food')),
          DataCell(Text(_setting.food.expense.toString()))
        ]),
        const DataRow(cells: <DataCell>[
          DataCell(Text('Excess cash')),
          DataCell(Text('0.0'))
        ]),
        DataRow(cells: <DataCell>[
          const DataCell(Text('Give Away')),
          DataCell(Text(_setting.giveAway.expense.toString()))
        ]),
        DataRow(cells: <DataCell>[
          const DataCell(Text('Investment')),
          DataCell(Text(_setting.investment.expense.toString()))
        ]),
        DataRow(cells: <DataCell>[
          const DataCell(Text('Safe Deposit')),
          DataCell(Text(_setting.safeDeposit.expense.toString()))
        ]),
      ]),
    );
  }

  Widget _addExpenseForm() {
    return Expanded(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Money amount'),
            controller: expenseTypeController,
          ),
          typeDropdownButton,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
                onPressed: () {
                  _submitForm(typeDropdownButton.dropDownState.dropdownValue,
                      expenseTypeController.text);
                },
                child: const Text('Submit')),
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [_addExpenseForm()],
          ),
          Row(
            children: [_listExpenses()],
          )
        ],
      ),
    );
  }

  @override
  void update(InterfaceSubject setting) {
    if (mounted) {
      setState(() {
        _setting = setting as Setting;
      });
    }
  }
}

const List<String> list = <String>[
  'Safe deposit',
  'Investment',
  'IG',
  'Give Away',
  'Need',
  'Food',
  'Subscription',
  'Rent'
];

class TypeDropdownButton extends StatefulWidget {
  TypeDropdownButton({
    Key? key,
  }) : super(key: key) {
    _DropdownButtonState dropDownState = _DropdownButtonState();
    this.dropDownState = dropDownState;
    // this.dropdownValue = dropDownState.getDropdownValue;
  }
  late _DropdownButtonState dropDownState;
  // String dropdownValue = 'none';

  @override
  State<StatefulWidget> createState() {
    // _DropdownButtonState dropDownState = _DropdownButtonState();
    // dropdownValue = dropDownState.getDropdownValue;
    return dropDownState;
  }
}

class _DropdownButtonState extends State<TypeDropdownButton> {
  // String _dropdownValue = 'none';
  // get getdropdownValue => _dropdownValue;

  String dropdownValue = list.first;
  get getDropdownValue => dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          // _dropdownValue = dropdownValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
