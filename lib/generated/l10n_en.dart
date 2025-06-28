// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get settings => 'Settings';

  @override
  String get mainCurrency => 'Main Currency';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get dailyReminder => 'Daily Reminder';

  @override
  String get exportAsPDF => 'Export as PDF';

  @override
  String get exportAsCSV => 'Export as CSV';

  @override
  String get language => 'Language';

  @override
  String get aboutApp => 'About This App';

  @override
  String get builtWithFlutter =>
      'Personal Finance Tracker v1.0\nBuilt with ❤️ using Flutter';

  @override
  String get overview => 'Overview';

  @override
  String get totalBalance => 'Total Balance';

  @override
  String get accounts => 'Accounts';

  @override
  String get cashFlow => 'Cash Flow';

  @override
  String get income => 'Income';

  @override
  String get expense => 'Expense';

  @override
  String get total => 'Total';

  @override
  String get categories => 'Categories';

  @override
  String get transactions => 'Transactions';

  @override
  String get daily => 'Daily';

  @override
  String get monthly => 'Monthly';

  @override
  String get budgets => 'Budgets';

  @override
  String get noBudgets => 'No active budgets';

  @override
  String asOf(Object month) {
    return 'as of $month';
  }
}
