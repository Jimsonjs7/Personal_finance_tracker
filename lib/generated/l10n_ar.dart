// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

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
  String get settings => 'الإعدادات';

  @override
  String get mainCurrency => 'العملة الرئيسية';

  @override
  String get darkTheme => 'الوضع الداكن';

  @override
  String get dailyReminder => 'تذكير يومي';

  @override
  String get exportAsPDF => 'تصدير كـ PDF';

  @override
  String get exportAsCSV => 'تصدير كـ CSV';

  @override
  String get language => 'اللغة';

  @override
  String get aboutApp => 'حول التطبيق';

  @override
  String get builtWithFlutter =>
      'متتبع النفقات الشخصية v1.0\nتم إنشاؤه بـ ❤️ باستخدام Flutter';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get totalBalance => 'إجمالي الرصيد';

  @override
  String get accounts => 'الحسابات';

  @override
  String get cashFlow => 'تدفق النقد';

  @override
  String get income => 'الدخل';

  @override
  String get expense => 'المصروفات';

  @override
  String get total => 'الإجمالي';

  @override
  String get categories => 'الفئات';

  @override
  String get transactions => 'المعاملات';

  @override
  String get daily => 'يومي';

  @override
  String get monthly => 'شهري';

  @override
  String get budgets => 'الميزانيات';

  @override
  String get noBudgets => 'لا توجد ميزانيات نشطة';

  @override
  String asOf(Object month) {
    return 'اعتبارًا من $month';
  }
}
