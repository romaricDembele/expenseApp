import '../model/setting_elements/interface_expense.dart';

abstract class InterfaceHomeController {
  void createHomeView();
  void createExpenseView();
  void addExpense(String dropdownValue, String expenseAmount);
  void saveExpense(String expenseType, String expenseAmount);
  void retrieveExpenses();
}
