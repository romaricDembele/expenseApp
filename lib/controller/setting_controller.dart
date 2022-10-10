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
  void setCalculationRules(
      {String? budget,
      String? safeDeposit,
      String? iG,
      String? investment,
      String? giveAway,
      String? need,
      String? food,
      String? subscription,
      String? rent}) {
    setting.setBudget = double.parse(budget!);
    setting.changeFoodRate(double.parse(food!));
    setting.changeSafeDepositRate(double.parse(safeDeposit!));
    setting.changeIgRate(double.parse(iG!));
    setting.changeInvestmentRate(double.parse(investment!));
    setting.changeGiveAwayRate(double.parse(giveAway!));
    setting.changeNeedRate(double.parse(need!));
    setting.changeSubscriptionRate(double.parse(subscription!));
    setting.changeRentRate(double.parse(rent!));
  }
}
