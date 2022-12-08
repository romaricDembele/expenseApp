import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_app/controller/load_setting_rates_port.dart';
import 'package:expenses_app/controller/update_setting_rates_port.dart';
import 'package:expenses_app/model/setting.dart';

class SettingAdapter implements UpdateSettingRatesPort, LoadSettingRatesPort {
  final FirebaseFirestore db;

  SettingAdapter(this.db);

  @override
  void updateSettingRates(Setting setting) {
    db
        .collection('settingRates')
        .doc('DjQE2CPvtsiP1MOJjfJo')
        .update(<String, dynamic>{
      "budget": setting.budget,
      "safeDeposit": setting.safeDeposit.rate,
      "iG": setting.iG.rate,
      "investment": setting.investment.rate,
      "giveAway": setting.giveAway.rate,
      "need": setting.need.rate,
      "food": setting.food.rate,
      "subscription": setting.subscription.rate,
      "rent": setting.rent.rate
    });
  }

  @override
  Future<void> loadSetting(Setting setting) async {
    final docRef = db.collection('settingRates').doc('DjQE2CPvtsiP1MOJjfJo');
    await docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      setting.setBudget = (data["budget"]).toDouble();
      setting.safeDeposit.rate = (data["safeDeposit"]).toDouble();
      setting.iG.rate = (data["iG"]).toDouble();
      setting.investment.rate = (data["investment"]).toDouble();
      setting.giveAway.rate = (data["giveAway"]).toDouble();
      setting.need.rate = (data["need"]).toDouble();
      setting.food.rate = (data["food"]).toDouble();
      setting.subscription.rate = (data["subscription"]).toDouble();
      setting.rent.rate = (data["rent"]).toDouble();
    });
    setting.budgetRemain.calculateRemainBudget();
  }
}
