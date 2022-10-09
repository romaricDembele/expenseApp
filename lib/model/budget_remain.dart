import 'package:expenses_app/controller/home_controller.dart';
import 'package:expenses_app/model/interface_subject.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/model/setting_elements/food.dart';
import 'package:expenses_app/model/setting_elements/give_away.dart';
import 'package:expenses_app/model/setting_elements/investment.dart';
import 'package:expenses_app/views/interface_observer.dart';

class BudgetRemain implements InterfaceSubject {
  double _remainFood = 0;
  double _excessCash = 0; // Waiting for expenses databaase setup.
  double _remainGiveAway = 0;
  double _remainInvestment = 0;

  Setting setting;

  BudgetRemain({required this.setting}) {
    calculateRemainFood();
    calculateExcessCash();
    calculateRemainGiveAway();
    calculateRemainInvestment();
  }

  get remainFood => _remainFood;

  set remainFood(value) => _remainFood = value;

  get excessCash => _excessCash;

  set excessCash(value) => _excessCash = value;

  get remainGiveAway => _remainGiveAway;

  set remainGiveAway(value) => _remainGiveAway = value;

  get remainInvestment => _remainInvestment;

  set remainInvestment(value) => _remainInvestment = value;

  void calculateRemainFood() {
    Food food = setting.food;
    double remainFood = 0;

    double budget = setting.budget;
    double rate = food.rate;
    double expense = food.expense;

    remainFood = (rate * budget) - expense;

    _remainFood = remainFood;
  }

  // Waiting for expenses databaase setup.
  void calculateExcessCash() {
    _excessCash = 1;
  }

  void calculateRemainGiveAway() {
    GiveAway giveAway = setting.giveAway;
    double remainGiveAway = 0;

    double budget = setting.budget;
    double rate = giveAway.rate;
    double expense = giveAway.expense;

    remainGiveAway = (rate * budget) - expense;

    _remainGiveAway = remainGiveAway;
  }

  void calculateRemainInvestment() {
    Investment investment = setting.investment;
    double remainInvestment = 0;

    double budget = setting.budget;
    double rate = investment.rate;
    double expense = investment.expense;

    remainInvestment = (rate * budget) - expense;

    _remainInvestment = remainInvestment;
  }

  @override
  List<InterfaceObserver> observers = [];

  @override
  void notifyObserver() {
    // TODO: implement notifyObserver
  }

  @override
  void subscribeObserver(InterfaceObserver observer) {
    // TODO: implement subscribeObserver
  }

  @override
  void unsubscribeObserver(InterfaceObserver observer) {
    // TODO: implement unsubscribeObserver
  }
}
