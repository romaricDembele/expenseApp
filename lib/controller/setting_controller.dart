import 'package:expenses_app/controller/interface_setting_controller.dart';
import 'package:expenses_app/views/setting_view.dart';
import 'package:expenses_app/model/setting.dart';

class SettingController implements InterfaceSettingController {
  Setting setting;
  late SettingView settingView;

  SettingController({required this.setting}) {
    settingView = SettingView(setting: setting, settingController: this);
  }

  @override
  void setSetting(Setting setting) {}
}
