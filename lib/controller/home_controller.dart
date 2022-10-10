import 'package:expenses_app/controller/interface_home_controller.dart';
import 'package:expenses_app/model/budget_remain.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/model/setting_elements/food.dart';
import 'package:expenses_app/views/expense_view.dart';
import 'package:expenses_app/views/home_view.dart';

class HomeController implements InterfaceHomeController {
  //Properties
  late HomeView _homeView;
  late ExpenseView _expenseView;

  Setting _setting;
  BudgetRemain _budgetRemain;

  //Getters
  get homeView => _homeView;
  get expenseView => _expenseView;

  // Constructor
  HomeController({required Setting setting})
      : _setting = setting,
        _budgetRemain = setting.budgetRemain {
    createHomeView();
    createExpenseView();
  }

  void createHomeView() {
    HomeView homeView =
        HomeView(budgetRemain: _budgetRemain, setting: _setting);
    _homeView = homeView;
  }

  void createExpenseView() {
    ExpenseView expenseView = ExpenseView(
      homeController: this,
      setting: _setting,
    );
    _expenseView = expenseView;
  }

  void addExpense(String dropdownValue, String expenseAmount) {
    switch (dropdownValue) {
      case 'Safe deposit':
        {
          _setting.addSafeDeposit(double.parse(expenseAmount));
        }
        break;
      case 'Investment':
        {
          _setting.addInvestment(double.parse(expenseAmount));
        }
        break;
      case 'IG':
        {
          _setting.addIG(double.parse(expenseAmount));
        }
        break;
      case 'Give Away':
        {
          _setting.addGiveAway(double.parse(expenseAmount));
        }
        break;
      case 'Need':
        {
          _setting.addNeed(double.parse(expenseAmount));
        }
        break;
      case 'Food':
        {
          _setting.addFood(double.parse(expenseAmount));
        }
        break;
      case 'Subscription':
        {
          _setting.addSubscription(double.parse(expenseAmount));
        }
        break;
      case 'Rent':
        {
          _setting.addRent(double.parse(expenseAmount));
        }
        break;
      default:
        {
          1 + 1;
        }
        break;
    }
  }
}
