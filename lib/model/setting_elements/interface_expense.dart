abstract class InterfaceExpense {
  double _rate = 0;
  double _expense = 0;

  get rate => _rate;
  set rate(value) => _rate = value;

  get expense => _expense;
  set expense(value) => _expense = value;

  // InterfaceExpense(double rate, double expense) {
  //   _rate = rate;
  //   _expense = expense;
  // }

  void addExpense(double expense) {
    _expense += expense;
  }
}
