import 'package:expenses_app/controller/port_in/set_expenses_port.dart';

abstract class LoadExpensesPort {
  Future<void> loadExpenses(SetExpensesPort setExpensesPort);
}
