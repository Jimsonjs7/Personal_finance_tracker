// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get general => 'General';

  @override
  String get currencyChangedTo => 'Currency changed to';

  @override
  String get reminder => 'Reminder';

  @override
  String get enabled => 'enabled';

  @override
  String get disabled => 'disabled';

  @override
  String get export => 'Export';

  @override
  String get appLanguage => 'App Language';

  @override
  String get languageSetTo => 'Language set to';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get mainCurrency => 'मुख्य मुद्रा';

  @override
  String get darkTheme => 'डार्क थीम';

  @override
  String get dailyReminder => 'दैनिक अनुस्मारक';

  @override
  String get exportAsPDF => 'PDF के रूप में निर्यात करें';

  @override
  String get exportAsCSV => 'CSV के रूप में निर्यात करें';

  @override
  String get language => 'भाषा';

  @override
  String get aboutApp => 'ऐप के बारे में';

  @override
  String get builtWithFlutter =>
      'पर्सनल फाइनेंस ट्रैकर v1.0\nFlutter से ❤️ के साथ निर्मित';

  @override
  String get overview => 'अवलोकन';

  @override
  String get totalBalance => 'कुल शेष';

  @override
  String get accounts => 'खाते';

  @override
  String get cashFlow => 'कैश फ्लो';

  @override
  String get income => 'आय';

  @override
  String get expense => 'व्यय';

  @override
  String get total => 'कुल';

  @override
  String get categories => 'श्रेणियाँ';

  @override
  String get transactions => 'लेन-देन';

  @override
  String get daily => 'दैनिक';

  @override
  String get monthly => 'मासिक';

  @override
  String get budgets => 'बजट';

  @override
  String get noBudgets => 'कोई सक्रिय बजट नहीं';

  @override
  String asOf(Object month) {
    return '$month के अनुसार';
  }
}
