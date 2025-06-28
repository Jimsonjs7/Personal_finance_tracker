// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get general => 'General';

  @override
  String get currencyChangedTo => 'കറൻസി മാറ്റിയിട്ടുണ്ട്';

  @override
  String get reminder => 'റിമൈൻഡർ';

  @override
  String get enabled => 'പ്രവർത്തനക്ഷമമാക്കിയിരിക്കുന്നു';

  @override
  String get disabled => 'നിഷ്ക്രിയം';

  @override
  String get export => 'റിപ്പോർട്ട് എടുക്കുക';

  @override
  String get appLanguage => 'ആപ്പിന്റെ ഭാഷ';

  @override
  String get languageSetTo => 'ഭാഷ ഇനിപ്പറയുന്നതായി സജ്ജമാക്കി';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get mainCurrency => 'പ്രധാന കറൻസി';

  @override
  String get darkTheme => 'ഇരുണ്ട തീം';

  @override
  String get dailyReminder => 'ദൈനംദിന റിമൈൻഡർ';

  @override
  String get exportAsPDF => 'PDF ആയി എക്സ്പോർട്ട് ചെയ്യുക';

  @override
  String get exportAsCSV => 'CSV ആയി എക്സ്പോർട്ട് ചെയ്യുക';

  @override
  String get language => 'ഭാഷ';

  @override
  String get aboutApp => 'About This App';

  @override
  String get builtWithFlutter =>
      'Personal Finance Tracker v1.0\nBuilt with ❤️ using Flutter';

  @override
  String get overview => 'അവലോകനം';

  @override
  String get totalBalance => 'മൊത്തം ബാലൻസ്';

  @override
  String get accounts => 'അക്കൗണ്ടുകൾ';

  @override
  String get cashFlow => 'പണമൊഴുക്ക്';

  @override
  String get income => 'വരുമാനം';

  @override
  String get expense => 'ചെലവ്';

  @override
  String get total => 'മൊത്തം';

  @override
  String get categories => 'വിഭാഗങ്ങൾ';

  @override
  String get transactions => ' ഇടപാടുകൾ';

  @override
  String get daily => 'ദൈനംദിനം';

  @override
  String get monthly => 'മാസത്തിൽ';

  @override
  String get budgets => 'ബജറ്റുകൾ';

  @override
  String get noBudgets => 'No active budgets';

  @override
  String asOf(Object month) {
    return 'as of $month';
  }
}
