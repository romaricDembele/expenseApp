import 'package:expenses_app/model/interface_subject.dart';

abstract class InterfaceObserver {
  void update(InterfaceSubject subject);
}
