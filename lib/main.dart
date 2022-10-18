import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:expenses_app/controller/home_controller.dart';
import 'package:expenses_app/controller/setting_controller.dart';
import 'package:expenses_app/model/budget_remain.dart';
import 'package:expenses_app/persistence/setting_adapter.dart';
import 'package:expenses_app/views/home_view.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

List<Object> setupApp() {
  Setting setting = Setting(
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
  FirebaseFirestore db = FirebaseFirestore.instance;
  SettingAdapter settingAdapter = SettingAdapter(db);
  SettingController settingController = SettingController(
      setting: setting,
      updateSettingRatesPort: settingAdapter,
      loadSettingRatesPort: settingAdapter);
  // BudgetRemain budgetRemain = BudgetRemain(setting: setting);
  HomeController homeController = HomeController(setting: setting);
  return [homeController, settingController];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = setupApp();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      home: AppStatefullWidget(),
    );
  }
}

class AppStatefullWidget extends StatefulWidget {
  const AppStatefullWidget({Key? key}) : super(key: key);

  @override
  State<AppStatefullWidget> createState() => _AppStatefullWidgetState();
}

List<Widget> generateAppViews() {
  List<Object> controllers = setupApp();
  // List<Object> controllers = [];
  // setupApp().then((List<Object> value) {
  //   controllers = value;
  // });

  HomeController homeController = controllers[0] as HomeController;
  SettingController settingController = controllers[1] as SettingController;
  List<Widget> appviews = [
    homeController.homeView,
    homeController.expenseView,
    // const Text('Settings View')
    settingController.settingView
  ];
  return appviews;
}

List<BottomNavigationBarItem> generateBottomNavigationBarItems() {
  return [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange), label: 'Add expense'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];
}

class _AppStatefullWidgetState extends State<AppStatefullWidget> {
  int _selectedIndex = 0;
  List<Widget> appviews = [];

  _AppStatefullWidgetState() {
    List<Widget> appviews = generateAppViews();
    this.appviews = appviews;
  }

  void _changeSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> appviews = _generateAppViews();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Manager'),
        ),
        body: appviews.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: generateBottomNavigationBarItems(),
          currentIndex: _selectedIndex,
          onTap: _changeSelectedItem,
        ));
  }
}
