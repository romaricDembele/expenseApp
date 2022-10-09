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

  BudgetRemain budgetRemain;
  Setting setting;

  //Getters
  get homeView => _homeView;
  get expenseView => _expenseView;

  // Constructor
  HomeController({required this.budgetRemain, required this.setting}) {
    createHomeView();
    createExpenseView();
  }

  void createHomeView() {
    HomeView homeView = HomeView(budgetRemain: budgetRemain);
    _homeView = homeView;
  }

  void createExpenseView() {
    ExpenseView expenseView = ExpenseView(
      homeController: this,
      setting: setting,
    );
    _expenseView = expenseView;
  }

  void addExpense(String dropdownValue, String expenseAmount) {
    switch (dropdownValue) {
      case 'Safe deposit':
        {
          setting.addSafeDeposit(double.parse(expenseAmount));
        }
        break;
      case 'Investment':
        {
          setting.addInvestment(double.parse(expenseAmount));
        }
        break;
      case 'IG':
        {
          setting.addIG(double.parse(expenseAmount));
        }
        break;
      case 'Give Away':
        {
          setting.addGiveAway(double.parse(expenseAmount));
        }
        break;
      case 'Need':
        {
          setting.addNeed(double.parse(expenseAmount));
        }
        break;
      case 'Food':
        {
          setting.addFood(double.parse(expenseAmount));
        }
        break;
      case 'Subscription':
        {
          setting.addSubscription(double.parse(expenseAmount));
        }
        break;
      case 'Rent':
        {
          setting.addRent(double.parse(expenseAmount));
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
