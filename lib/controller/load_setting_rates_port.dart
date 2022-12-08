import 'package:expenses_app/model/setting.dart';

abstract class LoadSettingRatesPort {
  Future<void> loadSetting(Setting setting);
}
