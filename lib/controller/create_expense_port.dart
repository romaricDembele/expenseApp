import 'package:expenses_app/model/setting_elements/interface_expense.dart';

abstract class CreateExpensePort {
  void createExpense(String expenseType, String expenseAmount);
}
