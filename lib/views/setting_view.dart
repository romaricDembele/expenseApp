import 'package:flutter/material.dart';

import 'package:expenses_app/controller/setting_controller.dart';
import 'package:expenses_app/model/setting_elements/food.dart';
import 'package:expenses_app/model/setting_elements/give_away.dart';
import 'package:expenses_app/model/setting_elements/i_g.dart';
import 'package:expenses_app/model/setting_elements/investment.dart';
import 'package:expenses_app/model/setting_elements/need.dart';
import 'package:expenses_app/model/setting_elements/rent.dart';
import 'package:expenses_app/model/setting_elements/safe_deposit.dart';
import 'package:expenses_app/model/setting_elements/subscription.dart';

// import 'package:expenses_app/controller/setting_controller.dart';
import 'package:expenses_app/views/interface_observer.dart';
import 'package:expenses_app/model/setting.dart';

class SettingView implements InterfaceObserver {
  SettingController settingController;
  Setting setting;

  SettingView({required this.setting, required this.settingController});

  @override
  void update() {
    // TODO: implement update
  }

  void setSetting() {
    // double budget = GetElementText('budget');

    // This data should be retreived from user input. èeq
    Setting sett = Setting(
        budget: 0,
        safeDeposit: SafeDeposit(),
        iG: IG(),
        investment: Investment(),
        giveAway: GiveAway(),
        need: Need(),
        food: Food(),
        subscription: Subscription(),
        rent: Rent());
    settingController.setSetting(sett);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
