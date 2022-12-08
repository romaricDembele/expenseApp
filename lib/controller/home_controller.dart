import 'package:expenses_app/controller/create_expense_port.dart';
import 'package:expenses_app/controller/interface_home_controller.dart';
import 'package:expenses_app/controller/load_expenses_port.dart';
import 'package:expenses_app/controller/port_in/set_expenses_port.dart';
import 'package:expenses_app/model/budget_remain.dart';
import 'package:expenses_app/model/setting.dart';
import 'package:expenses_app/views/expense_view.dart';
import 'package:expenses_app/views/home_view.dart';

class HomeController implements InterfaceHomeController, SetExpensesPort {
  //Properties
  late HomeView _homeView;
  late ExpenseView _expenseView;

  Setting _setting;
  BudgetRemain _budgetRemain;

  CreateExpensePort createExpensePort;
  LoadExpensesPort loadExpensesPort;

  //Getters
  get homeView => _homeView;
  get expenseView => _expenseView;

  // Constructor
  HomeController(
      {required Setting setting,
      required this.createExpensePort,
      required this.loadExpensesPort})
      : _setting = setting,
        _budgetRemain = setting.budgetRemain {
    createHomeView();
    createExpenseView();
  }

  @override
  void createHomeView() {
    HomeView homeView =
        HomeView(budgetRemain: _budgetRemain, setting: _setting);
    _homeView = homeView;
  }

  @override
  void createExpenseView() {
    ExpenseView expenseView = ExpenseView(
      homeController: this,
      setting: _setting,
    );
    _expenseView = expenseView;
  }

  @override
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

  @override
  void saveExpense(String expenseType, String expenseAmount) {
    createExpensePort.createExpense(expenseType, expenseAmount);
  }

  @override
  Future<void> retrieveExpenses() async {
    await loadExpensesPort.loadExpenses(this);
  }

  @override
  void setExpense(Map<String, dynamic> doc) {
    switch (doc["expense_type"]) {
      case 'Safe deposit':
        {
          _setting.addSafeDeposit((doc["expense_value"]).toDouble());
        }
        break;
      case 'Investment':
        {
          _setting.addInvestment((doc["expense_value"]).toDouble());
        }
        break;
      case 'IG':
        {
          _setting.addIG((doc["expense_value"]).toDouble());
        }
        break;
      case 'Give Away':
        {
          _setting.addGiveAway((doc["expense_value"]).toDouble());
        }
        break;
      case 'Need':
        {
          _setting.addNeed((doc["expense_value"]).toDouble());
        }
        break;
      case 'Food':
        {
          _setting.addFood((doc["expense_value"]).toDouble());
        }
        break;
      case 'Subscription':
        {
          _setting.addSubscription((doc["expense_value"]).toDouble());
        }
        break;
      case 'Rent':
        {
          _setting.addRent((doc["expense_value"]).toDouble());
        }
        break;
      default:
        {
          1 + 1;
        }
        break;

      // case 'Safe deposit':
      //   {
      //     _setting.safeDeposit.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Investment':
      //   {
      //     _setting.investment.value = doc["expense_value"];
      //   }
      //   break;
      // case 'IG':
      //   {
      //     _setting.iG.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Give Away':
      //   {
      //     _setting.giveAway.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Need':
      //   {
      //     _setting.need.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Food':
      //   {
      //     _setting.food.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Subscription':
      //   {
      //     _setting.subscription.value = doc["expense_value"];
      //   }
      //   break;
      // case 'Rent':
      //   {
      //     _setting.rent.value = doc["expense_value"];
      //   }
      //   break;
      // default:
      //   {
      //     1 + 1;
      //   }
      //   break;
    }
  }
}
