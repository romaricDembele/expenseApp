import 'package:expenses_app/controller/interface_home_controller.dart';
import 'package:expenses_app/views/home_view.dart';

class HomeController implements InterfaceHomeController {
  //Properties
  static const _homeView = HomeView();

  //Getter
  get homeView => _homeView;

  // Constructor
  HomeController();
}
