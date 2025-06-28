import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:personal_finance_tracker/providers/currency_provider.dart';
import 'package:personal_finance_tracker/providers/languague_support.dart';
import 'main.dart'; // For MyAppTheme.toggleTheme()
import 'generated/l10n.dart'; // AppLocalizations class

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkTheme = false;
  bool _dailyReminder = false;

  final List<String> _currencies = ['INR', 'USD', 'EUR', 'GBP'];
  final Map<String, String> _langMap = {
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'hi': 'Hindi',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'ar': 'Arabic',
  };

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;
    setState(() {
      _darkTheme = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyProvider = Provider.of<CurrencyProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final s = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(s.settings, style: theme.textTheme.titleLarge),
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        iconTheme: theme.iconTheme,
        elevation: 1,
      ),
      backgroundColor: theme.colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle(s.general, theme),

          _buildDropdownTile(
            s.mainCurrency,
            currencyProvider.targetCurrency,
            _currencies,
                (val) async {
              if (val != null) {
                await currencyProvider.updateCurrency(val);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${s.currencyChangedTo} $val")),
                );
              }
            },
            displayMap: {
              'INR': '₹',
              'USD': '\$',
              'EUR': '€',
              'GBP': '£',
            },
            theme: theme,
          ),

          _buildSwitchTile(s.darkTheme, _darkTheme, (val) async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isDarkTheme', val);
            setState(() => _darkTheme = val);
            MyAppTheme.toggleTheme(val);
          }, theme),

          _buildSwitchTile(s.dailyReminder, _dailyReminder, (val) {
            setState(() => _dailyReminder = val);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${s.reminder} ${val ? s.enabled : s.disabled}")),
            );
          }, theme),

          const SizedBox(height: 24),
          _sectionTitle(s.export, theme),
          _buildExportTile(s.exportAsPDF, Icons.picture_as_pdf, theme),
          _buildExportTile(s.exportAsCSV, Icons.table_chart, theme),

          const SizedBox(height: 24),
          _sectionTitle(s.language, theme),

          _buildDropdownTile(
            s.appLanguage,
            languageProvider.locale.languageCode,
            _langMap.keys.toList(),
                (val) async {
              if (val != null) {
                await languageProvider.changeLanguage(val);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${s.languageSetTo} ${_langMap[val]}")),
                );
              }
            },
            displayMap: _langMap,
            theme: theme,
          ),

          const SizedBox(height: 24),
          _sectionTitle(s.aboutApp, theme),
          ListTile(
            title: Text(s.aboutApp, style: theme.textTheme.bodyLarge),
            subtitle: Text(s.builtWithFlutter, style: theme.textTheme.bodySmall),
            leading: Icon(Icons.info_outline, color: theme.colorScheme.primary),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDropdownTile(
      String title,
      String currentValue,
      List<String> options,
      void Function(String?) onChanged, {
        Map<String, String>? displayMap,
        required ThemeData theme,
      }) {
    return ListTile(
      title: Text(title, style: theme.textTheme.bodyLarge),
      trailing: DropdownButton<String>(
        value: currentValue,
        dropdownColor: theme.colorScheme.surface,
        style: theme.textTheme.bodyMedium,
        onChanged: onChanged,
        items: options.map((opt) {
          return DropdownMenuItem(
            value: opt,
            child: Text(displayMap?[opt] ?? opt),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, ValueChanged<bool> onChanged, ThemeData theme) {
    return SwitchListTile(
      title: Text(title, style: theme.textTheme.bodyLarge),
      value: value,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
    );
  }

  Widget _buildExportTile(String title, IconData icon, ThemeData theme) {
    return ListTile(
      title: Text(title, style: theme.textTheme.bodyLarge),
      leading: Icon(icon, color: theme.colorScheme.secondary),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title triggered")),
        );
      },
    );
  }
}
