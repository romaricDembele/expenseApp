import 'package:expenses_app/views/interface_observer.dart';
import 'package:expenses_app/views/setting_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget implements InterfaceObserver {
  const HomeView({Key? key}) : super(key: key);

  static const String _title = 'Home View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
      ),
      body: const Text('data'),
      bottomNavigationBar: const HomeBottomBarStatefullWidget(),
    );
  }

  @override
  void update() {
    // TODO: implement update
  }
}

class HomeBottomBarStatefullWidget extends StatefulWidget {
  const HomeBottomBarStatefullWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeBottomBarState();
  }
}

List<BottomNavigationBarItem> generateBottomNavigationBarItems() {
  return [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange), label: 'Add expense'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];
}

class _HomeBottomBarState extends State {
  int _selectedIndex = 0;
  void changeSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: generateBottomNavigationBarItems(),
      currentIndex: _selectedIndex,
      onTap: changeSelectedItem,
    );
  }
}
