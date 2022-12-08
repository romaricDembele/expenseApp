import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_app/controller/create_expense_port.dart';
import 'package:expenses_app/controller/load_expenses_port.dart';
import 'package:expenses_app/controller/port_in/set_expenses_port.dart';

class ExpenseAdapter implements CreateExpensePort, LoadExpensesPort {
  FirebaseFirestore db;
  // late SetExpensesPort setExpensesPort;

  ExpenseAdapter(this.db);

  @override
  void createExpense(String expenseType, String expenseAmount) {
    String name = "Nom Aléatoire";

    db.collection('expenses').doc().set(<String, dynamic>{
      "expense_date": DateTime.now(),
      "expense_name": name,
      "expense_type": expenseType,
      "expense_value": double.parse(expenseAmount)
    });
  }

  @override
  Future<void> loadExpenses(SetExpensesPort setExpensesPort) async {
    // this.setExpensesPort = setExpensesPort;
    final DateTime currentDate = DateTime.now();
    final int currentMonth = currentDate.month;
    int currentYear = currentDate.year;
    DateTime lastDateOfMonth = DateTime(currentYear, currentMonth + 1, 0);
    DateTime firstDateOfMonth = DateTime(currentYear, currentMonth, 1);

    final expensesRef = db.collection('expenses');
    await expensesRef
        .where("expense_date", isGreaterThanOrEqualTo: firstDateOfMonth)
        .where("expense_date", isLessThanOrEqualTo: lastDateOfMonth)
        .get(const GetOptions(source: Source.server))
        .then((value) {
      value.docs.forEach((doc) {
        final data = doc.data();
        setExpensesPort.setExpense(data);
      });
    });
  }
}
