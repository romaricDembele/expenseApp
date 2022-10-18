import 'package:expenses_app/model/interface_subject.dart';
import 'package:flutter/material.dart';

import 'package:expenses_app/controller/setting_controller.dart';

// import 'package:expenses_app/controller/setting_controller.dart';
import 'package:expenses_app/views/interface_observer.dart';
import 'package:expenses_app/model/setting.dart';

class SettingView extends StatefulWidget {
  SettingController settingController;
  Setting setting;

  SettingView(
      {Key? key, required this.setting, required this.settingController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SettingViewState(settingController, setting);
}

class _SettingViewState extends State<SettingView>
    implements InterfaceObserver {
  SettingController _settingController;
  Setting _setting;
  _SettingViewState(this._settingController, this._setting) {
    _setting.subscribeObserver(this);
    _settingController.retrieveSettings();
  }

  final salaryController = TextEditingController();
  final safeDepositController = TextEditingController();
  final iGController = TextEditingController();
  final foodController = TextEditingController();
  final rentController = TextEditingController();
  final needController = TextEditingController();
  final giveAwayController = TextEditingController();
  final subscriptionController = TextEditingController();
  final investmentController = TextEditingController();

  Padding _generateUserInputField(
      {required String hintText,
      required TextEditingController inputController}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: TextFormField(
        controller: inputController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: hintText),
      ),
    );
  }

  @override
  void dispose() {
    salaryController.dispose();
    super.dispose();
  }

  Padding _genrateSettedSettingElement(String value) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Text(
          value,
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 55, 255).withOpacity(0.6)),
        ));
  }

  Widget _generateSettedSettingDataTable() {
    return DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Type')),
      DataColumn(label: Text('Rate'))
    ], rows: <DataRow>[
      DataRow(cells: <DataCell>[
        const DataCell(Text('Salary')),
        DataCell(_genrateSettedSettingElement(_setting.budget.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Safe Deposit')),
        DataCell(
            _genrateSettedSettingElement(_setting.safeDeposit.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('IG')),
        DataCell(_genrateSettedSettingElement(_setting.iG.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Investment')),
        DataCell(
            _genrateSettedSettingElement(_setting.investment.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Give Away')),
        DataCell(
            _genrateSettedSettingElement(_setting.giveAway.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Needs')),
        DataCell(_genrateSettedSettingElement(_setting.need.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Food')),
        DataCell(_genrateSettedSettingElement(_setting.food.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Subsript')),
        DataCell(
            _genrateSettedSettingElement(_setting.subscription.rate.toString()))
      ]),
      DataRow(cells: <DataCell>[
        const DataCell(Text('Rent')),
        DataCell(_genrateSettedSettingElement(_setting.rent.rate.toString()))
      ]),
    ]);
  }

  _submitNewSettings() {
    _settingController.setCalculationRules(
        budget: salaryController.text,
        safeDeposit: safeDepositController.text,
        iG: iGController.text,
        investment: investmentController.text,
        giveAway: giveAwayController.text,
        need: needController.text,
        food: foodController.text,
        subscription: subscriptionController.text,
        rent: rentController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(child: Column(children: [_generateSettedSettingDataTable()])),
        Expanded(
          child: Column(children: [
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Padding>[
                        _generateUserInputField(
                            hintText: 'Salary',
                            inputController: salaryController),
                        _generateUserInputField(
                            hintText: 'Safe Deposit rate',
                            inputController: safeDepositController),
                        _generateUserInputField(
                            hintText: 'IG rate', inputController: iGController),
                        _generateUserInputField(
                            hintText: 'Investment rate',
                            inputController: investmentController),
                        _generateUserInputField(
                            hintText: 'Give Away rate',
                            inputController: giveAwayController),
                        _generateUserInputField(
                            hintText: 'Needs rate',
                            inputController: needController),
                        _generateUserInputField(
                            hintText: 'Food rate',
                            inputController: foodController),
                        _generateUserInputField(
                            hintText: 'Subscriptions rate',
                            inputController: subscriptionController),
                        _generateUserInputField(
                            hintText: 'Rent rate',
                            inputController: rentController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 27.0),
                    child: ElevatedButton(
                        onPressed: (() => _submitNewSettings()),
                        child: const Text('Apply')),
                  )
                ],
              ),
            ),
          ]),
        )
      ],
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
