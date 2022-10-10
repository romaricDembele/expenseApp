import 'package:expenses_app/model/budget_remain.dart';
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
  late BudgetRemain budgetRemain;
  get getBudgetRemain => budgetRemain;

  get budget => _budget;

  set setBudget(double value) {
    _budget = value;
    budgetRemain.calculateRemainBudget();
  }

  // // get setting => _setting;
  // // set setting(value) => _setting = value;

  get safeDeposit => _safeDeposit;

  get iG => _iG;
  set iG(value) => _iG = value;

  get investment => _investment;

  get giveAway => _giveAway;

  get need => _need;

  get food => _food;

  get subscription => _subscription;

  get rent => _rent;

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
        _rent = rent {
    createBudgetRemain();
  }

  @override
  List<InterfaceObserver> observers = [];

  void createBudgetRemain() {
    BudgetRemain remain = BudgetRemain(setting: this);
    budgetRemain = remain;
  }

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
  void unsubscribeObserver(InterfaceObserver observer) {
    observers.remove(observer);
  }

  @override
  void addFood(double expense) {
    _food.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addGiveAway(double expense) {
    _giveAway.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addIG(double expense) {
    _iG.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addInvestment(double expense) {
    _investment.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addNeed(double expense) {
    _need.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addRent(double expense) {
    _rent.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addSafeDeposit(double expense) {
    _safeDeposit.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void addSubscription(double expense) {
    _subscription.addExpense(expense);
    notifyObserver();
    budgetRemain.calculateRemainBudget();
  }

  @override
  void changeFoodRate(double rate) {
    _food.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainFood();
  }

  @override
  void changeGiveAwayRate(double rate) {
    _giveAway.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainGiveAway();
  }

  @override
  void changeIgRate(double rate) {
    _iG.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainIg();
  }

  @override
  void changeInvestmentRate(double rate) {
    _investment.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainInvestment();
  }

  @override
  void changeNeedRate(double rate) {
    _need.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainNeed();
  }

  @override
  void changeRentRate(double rate) {
    _rent.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainRent();
  }

  @override
  void changeSafeDepositRate(double rate) {
    _safeDeposit.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainSafeDeposit();
  }

  @override
  void changeSubscriptionRate(double rate) {
    _subscription.rate = (rate);
    notifyObserver();
    budgetRemain.calculateRemainSubscription();
  }
}
