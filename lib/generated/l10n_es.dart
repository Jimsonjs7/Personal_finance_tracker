// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

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
  String get settings => 'Configuración';

  @override
  String get mainCurrency => 'Moneda principal';

  @override
  String get darkTheme => 'Tema oscuro';

  @override
  String get dailyReminder => 'Recordatorio diario';

  @override
  String get exportAsPDF => 'Exportar como PDF';

  @override
  String get exportAsCSV => 'Exportar como CSV';

  @override
  String get language => 'Idioma';

  @override
  String get aboutApp => 'Acerca de esta aplicación';

  @override
  String get builtWithFlutter =>
      'Personal Finance Tracker v1.0\nHecho con ❤️ usando Flutter';

  @override
  String get overview => 'Resumen';

  @override
  String get totalBalance => 'Saldo total';

  @override
  String get accounts => 'Cuentas';

  @override
  String get cashFlow => 'Flujo de efectivo';

  @override
  String get income => 'Ingresos';

  @override
  String get expense => 'Gastos';

  @override
  String get total => 'Total';

  @override
  String get categories => 'Categorías';

  @override
  String get transactions => 'Transacciones';

  @override
  String get daily => 'Diario';

  @override
  String get monthly => 'Mensual';

  @override
  String get budgets => 'Presupuestos';

  @override
  String get noBudgets => 'No hay presupuestos activos';

  @override
  String asOf(Object month) {
    return 'a partir de $month';
  }
}
