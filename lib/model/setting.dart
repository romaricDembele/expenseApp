import 'package:expenses_app/model/interface_setting.dart';
import 'package:expenses_app/model/interface_subject.dart';
import 'package:expenses_app/model/setting_elements/food.dart';
import 'package:expenses_app/model/setting_elements/give_away.dart';
import 'package:expenses_app/model/setting_elements/i_g.dart';
import 'package:expenses_app/model/setting_elements/investment.dart';
import 'package:expenses_app/model/setting_elements/need.dart';
import 'package:expenses_app/model/setting_elements/rent.dart';
import 'package:expenses_app/model/setting_elements/safe_deposit.dart';
import 'package:expenses_app/model/setting_elements/subscription.dart';
import 'package:expenses_app/views/interface_observer.dart';

class Setting implements InterfaceSubject, InterfaceSetting {
  double _budget;
  // Setting _setting;
  SafeDeposit _safeDeposit;
  IG _iG;
  Investment _investment;
  GiveAway _giveAway;
  Need _need;
  Food _food;
  Subscription _subscription;
  Rent _rent;

  get budget => _budget;
  set budget(value) => _budget = value;

  // // get setting => _setting;
  // // set setting(value) => _setting = value;

  get safeDeposit => _safeDeposit;
  set safeDeposit(value) {
    _safeDeposit = value;
    notifyObserver();
  }

  get iG => _iG;
  set iG(value) => _iG = value;

  get investment => _investment;
  set investment(value) {
    _investment = value;
    notifyObserver();
  }

  get giveAway => _giveAway;
  set giveAway(value) {
    _giveAway = value;
    notifyObserver();
  }

  get need => _need;
  set need(value) {
    _need = value;
    notifyObserver();
  }

  get food => _food;
  set setFood(value) {
    _food = value;
    notifyObserver();
  }

  get subscription => _subscription;
  set subscription(value) {
    _subscription = value;
    notifyObserver();
  }

  get rent => _rent;
  set rent(value) {
    _rent = value;
    notifyObserver();
  }

  // Constructor
  Setting(
      {required double budget,
      required SafeDeposit safeDeposit,
      required IG iG,
      required Investment investment,
      required GiveAway giveAway,
      required Need need,
      required Food food,
      required Subscription subscription,
      required Rent rent})
      : _budget = budget,
        _safeDeposit = safeDeposit,
        _iG = iG,
        _investment = investment,
        _giveAway = giveAway,
        _need = need,
        _food = food,
        _subscription = subscription,
        _rent = rent;

  @override
  List<InterfaceObserver> observers = [];

  @override
  void notifyObserver() {
    for (InterfaceObserver ob in observers) {
      ob.update(this);
    }
  }

  @override
  void subscribeObserver(InterfaceObserver observer) {
    observers.add(observer);
  }

  @override
  void unsubscribeObserver(InterfaceObserver observer) {}

  @override
  void addFood(double expense) {
    _food.addExpense(expense);
    notifyObserver();
  }

  @override
  void addGiveAway(double expense) {
    _giveAway.addExpense(expense);
    notifyObserver();
  }

  @override
  void addIG(double expense) {
    _iG.addExpense(expense);
    notifyObserver();
  }

  @override
  void addInvestment(double expense) {
    _investment.addExpense(expense);
    notifyObserver();
  }

  @override
  void addNeed(double expense) {
    _need.addExpense(expense);
    notifyObserver();
  }

  @override
  void addRent(double expense) {
    _rent.addExpense(expense);
    notifyObserver();
  }

  @override
  void addSafeDeposit(double expense) {
    _safeDeposit.addExpense(expense);
    notifyObserver();
  }

  @override
  void addSubscription(double expense) {
    _subscription.addExpense(expense);
    notifyObserver();
  }
}
