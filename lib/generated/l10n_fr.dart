// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get general => 'General';

  @override
  String get currencyChangedTo => 'Devise changée en';

  @override
  String get reminder => 'Rappel';

  @override
  String get enabled => 'activé';

  @override
  String get disabled => 'désactivé';

  @override
  String get export => 'Exporter';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get languageSetTo => 'Langue définie sur';

  @override
  String get settings => 'Paramètres';

  @override
  String get mainCurrency => 'Devise principale';

  @override
  String get darkTheme => 'Thème sombre';

  @override
  String get dailyReminder => 'Rappel quotidien';

  @override
  String get exportAsPDF => 'Exporter en PDF';

  @override
  String get exportAsCSV => 'Exporter en CSV';

  @override
  String get language => 'Langue';

  @override
  String get aboutApp => 'About This App';

  @override
  String get builtWithFlutter =>
      'Personal Finance Tracker v1.0\nBuilt with ❤️ using Flutter';

  @override
  String get overview => 'Aperçu';

  @override
  String get totalBalance => 'Solde total';

  @override
  String get accounts => 'Comptes';

  @override
  String get cashFlow => 'Flux de trésorerie';

  @override
  String get income => 'Revenu';

  @override
  String get expense => 'Dépense';

  @override
  String get total => 'Total';

  @override
  String get categories => 'Catégories';

  @override
  String get transactions => 'Transactions';

  @override
  String get daily => 'Quotidien';

  @override
  String get monthly => 'Mensuel';

  @override
  String get budgets => 'Budgets';

  @override
  String get noBudgets => 'No active budgets';

  @override
  String asOf(Object month) {
    return 'as of $month';
  }
}
