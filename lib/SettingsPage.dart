import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:personal_finance_tracker/providers/currency_provider.dart';
import 'main.dart'; // For MyAppTheme.toggleTheme()

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _language = 'English';
  bool _darkTheme = false;
  bool _dailyReminder = false;

  final List<String> _currencies = ['INR', 'USD', 'EUR', 'GBP'];
  final List<String> _languages = ['English', 'Spanish', 'French', 'Hindi'];

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
    final currencyProvider = Provider.of<CurrencyProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: theme.textTheme.titleLarge),
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        iconTheme: theme.iconTheme,
        elevation: 1,
      ),
      backgroundColor: theme.colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle("General", theme),
          _buildDropdownTile(
            "Main Currency",
            currencyProvider.targetCurrency,
            _currencies,
                (val) async {
              if (val != null) {
                await currencyProvider.updateCurrency(val);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Currency changed to $val")),
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
          _buildSwitchTile("Dark Theme", _darkTheme, (val) async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isDarkTheme', val);
            setState(() => _darkTheme = val);
            MyAppTheme.toggleTheme(val);
          }, theme),
          _buildSwitchTile("Daily Reminder", _dailyReminder, (val) {
            setState(() => _dailyReminder = val);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Reminder ${val ? 'enabled' : 'disabled'}")),
            );
          }, theme),
          const SizedBox(height: 24),
          _sectionTitle("Export", theme),
          _buildExportTile("Export as PDF", Icons.picture_as_pdf, theme),
          _buildExportTile("Export as CSV", Icons.table_chart, theme),
          const SizedBox(height: 24),
          _sectionTitle("Language", theme),
          _buildDropdownTile("App Language", _language, _languages, (val) {
            if (val != null) {
              setState(() => _language = val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Language set to $val")),
              );
            }
          }, theme: theme),
          const SizedBox(height: 24),
          _sectionTitle("About", theme),
          ListTile(
            title: Text("About This App", style: theme.textTheme.bodyLarge),
            subtitle: Text("Personal Finance Tracker v1.0\nBuilt with ❤️ using Flutter", style: theme.textTheme.bodySmall),
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
