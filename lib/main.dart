import 'package:expenses_app/controller/home_controller.dart';
import 'package:expenses_app/controller/setting_controller.dart';
import 'package:flutter/material.dart';

import 'model/setting_elements/food.dart';
import 'model/setting_elements/give_away.dart';
import 'model/setting_elements/investment.dart';
import 'model/setting_elements/need.dart';
import 'model/setting_elements/rent.dart';
import 'model/setting_elements/safe_deposit.dart';
import 'model/setting_elements/subscription.dart';
import 'model/setting_elements/i_g.dart';
import 'model/setting.dart';

// import './controller/setting_controller.dart';

void main() {
  runApp(const MyApp());
}

HomeController setupApp() {
  Setting sett = Setting(
      budget: 0,
      food: Food(),
      giveAway: GiveAway(),
      iG: IG(),
      investment: Investment(),
      need: Need(),
      rent: Rent(),
      safeDeposit: SafeDeposit(),
      subscription: Subscription());
  // ignore: unused_local_variable
  SettingController settingController = SettingController(setting: sett);
  //  _budgetRemain = BudgetRemain();
  HomeController homeController = HomeController();
  return homeController;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = setupApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      home: homeController.homeView,
    );
  }
}
