// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get general => 'General';

  @override
  String get currencyChangedTo => 'நாணயம் மாற்றப்பட்டுள்ளது';

  @override
  String get reminder => 'நினைவூட்டல்';

  @override
  String get enabled => 'இயக்கப்பட்டது';

  @override
  String get disabled => 'முடக்கப்பட்டது';

  @override
  String get export => 'ஏற்றுமதி';

  @override
  String get appLanguage => 'பயன்பாட்டு மொழி';

  @override
  String get languageSetTo => 'மொழி மாற்றப்பட்டது';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get mainCurrency => 'முதன்மை நாணயம்';

  @override
  String get darkTheme => 'இருண்ட தீம்';

  @override
  String get dailyReminder => 'தினசரி நினைவூட்டல்';

  @override
  String get exportAsPDF => 'PDF ஆக ஏற்றுமதி செய்யவும்';

  @override
  String get exportAsCSV => 'CSV ஆக ஏற்றுமதி செய்யவும்';

  @override
  String get language => 'மொழி';

  @override
  String get aboutApp => 'About This App';

  @override
  String get builtWithFlutter =>
      'Personal Finance Tracker v1.0\nBuilt with ❤️ using Flutter';

  @override
  String get overview => 'கண்ணோட்டம்';

  @override
  String get totalBalance => 'மொத்த இருப்பு';

  @override
  String get accounts => 'கணக்குகள்';

  @override
  String get cashFlow => 'பண ஓட்டம்';

  @override
  String get income => 'வருமானம்';

  @override
  String get expense => 'செலவு';

  @override
  String get total => 'மொத்தம்';

  @override
  String get categories => 'வகைகள்';

  @override
  String get transactions => 'பணப்பரிமாற்றங்கள்';

  @override
  String get daily => 'தினசரி';

  @override
  String get monthly => 'மாதாந்திரம்';

  @override
  String get budgets => 'திட்டங்கள்';

  @override
  String get noBudgets => 'No active budgets';

  @override
  String asOf(Object month) {
    return 'as of $month';
  }
}
