import 'package:expenses_app/views/interface_observer.dart';

abstract class InterfaceSubject {
  List<InterfaceObserver> observers = [];

  void subscribeObserver(InterfaceObserver observer) {
    observers.add(observer);
  }

  void unsubscribeObserver(InterfaceObserver observer) {
    observers.remove(observer);
  }

  void notifyObserver();
}
