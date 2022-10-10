import 'package:expenses_app/model/interface_subject.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/model/setting_elements/food.dart';
import 'package:expenses_app/model/setting_elements/give_away.dart';
import 'package:expenses_app/model/setting_elements/i_g.dart';
import 'package:expenses_app/model/setting_elements/investment.dart';
import 'package:expenses_app/model/setting_elements/need.dart';
import 'package:expenses_app/model/setting_elements/rent.dart';
import 'package:expenses_app/model/setting_elements/safe_deposit.dart';
import 'package:expenses_app/model/setting_elements/subscription.dart';
import 'package:expenses_app/views/interface_observer.dart';

class BudgetRemain implements InterfaceSubject {
  double _remainFood = 0;
  double _excessCash = 0; // Waiting for expenses databaase setup.
  double _remainGiveAway = 0;
  double _remainInvestment = 0;
  double _remainNeed = 0;
  double _remainRent = 0;
  double _remainSafeDeposit = 0;
  double _remainSubscription = 0;
  double _remainiG = 0;

  Setting setting;

  BudgetRemain({required this.setting}) {
    calculateRemainBudget();
  }

  get remainFood => _remainFood;

  get excessCash => _excessCash;

  get remainGiveAway => _remainGiveAway;

  get remainInvestment => _remainInvestment;

  void calculateRemainBudget() {
    calculateRemainFood();
    calculateExcessCash();
    calculateRemainGiveAway();
    calculateRemainInvestment();
    calculateRemainIg();
    calculateRemainNeed();
    calculateRemainRent();
    calculateRemainSafeDeposit();
    calculateRemainSubscription();
    notifyObserver();
  }

  void calculateRemainFood() {
    Food food = setting.food;
    double remainFood = 0;

    double budget = setting.budget;
    double rate = food.rate;
    double expense = food.expense;

    remainFood = (rate * budget) - expense;

    _remainFood = remainFood;
    notifyObserver();
  }

  // Waiting for expenses databaase setup.
  void calculateExcessCash() {
    _excessCash = 1;
    notifyObserver();
  }

  void calculateRemainGiveAway() {
    GiveAway giveAway = setting.giveAway;
    double remainGiveAway = 0;

    double budget = setting.budget;
    double rate = giveAway.rate;
    double expense = giveAway.expense;

    remainGiveAway = (rate * budget) - expense;

    _remainGiveAway = remainGiveAway;
    notifyObserver();
  }

  void calculateRemainInvestment() {
    Investment investment = setting.investment;
    double remainInvestment = 0;

    double budget = setting.budget;
    double rate = investment.rate;
    double expense = investment.expense;

    remainInvestment = (rate * budget) - expense;

    _remainInvestment = remainInvestment;
    notifyObserver();
  }

  void calculateRemainNeed() {
    Need need = setting.need;
    double remainNeed = 0;

    double budget = setting.budget;
    double rate = need.rate;
    double expense = need.expense;

    remainNeed = (rate * budget) - expense;

    _remainNeed = remainNeed;
    notifyObserver();
  }

  void calculateRemainRent() {
    Rent rent = setting.rent;
    double remainRent = 0;

    double budget = setting.budget;
    double rate = rent.rate;
    double expense = rent.expense;

    remainRent = (rate * budget) - expense;

    _remainRent = remainRent;
    notifyObserver();
  }

  void calculateRemainSafeDeposit() {
    SafeDeposit safeDeposit = setting.safeDeposit;
    double remainSafeDeposit = 0;

    double budget = setting.budget;
    double rate = safeDeposit.rate;
    double expense = safeDeposit.expense;

    remainSafeDeposit = (rate * budget) - expense;

    _remainSafeDeposit = remainSafeDeposit;
    notifyObserver();
  }

  void calculateRemainSubscription() {
    Subscription subscription = setting.subscription;
    double remainSubscription = 0;

    double budget = setting.budget;
    double rate = subscription.rate;
    double expense = subscription.expense;

    remainSubscription = (rate * budget) - expense;

    _remainSubscription = remainSubscription;
    notifyObserver();
  }

  void calculateRemainIg() {
    IG iG = setting.iG;
    double remainIG = 0;

    double budget = setting.budget;
    double rate = iG.rate;
    double expense = iG.expense;

    remainIG = (rate * budget) - expense;

    _remainiG = remainIG;
    notifyObserver();
  }

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
}
