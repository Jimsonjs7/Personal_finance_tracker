import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finance_tracker/SettingsPage.dart';

final ValueNotifier<String> _viewType = ValueNotifier("Monthly");

final List<Map<String, dynamic>> transactions = [
  {
    "date": "26 June 2025",
    "type": "Expense",
    "category": "Food",
    "amount": 250,
    "icon": Icons.fastfood,
    "color": Colors.red,
  },
  {
    "date": "26 June 2025",
    "type": "Income",
    "category": "Salary",
    "amount": 15000,
    "icon": Icons.attach_money,
    "color": Colors.green,
  },
  {
    "date": "25 June 2025",
    "type": "Expense",
    "category": "Transport",
    "amount": 100,
    "icon": Icons.directions_bus,
    "color": Colors.orange,
  },
];

class HomeScreen extends StatelessWidget {
  final double balance = 3000.0;
  final double income = 0.0;
  final double expense = 0.0;

  final List<Map<String, dynamic>> categories = [
    {"name": "Food & Drinks", "icon": Icons.fastfood, "amount": 0.0, "color": Colors.red},
    {"name": "Shopping", "icon": Icons.shopping_cart, "amount": 0.0, "color": Colors.pink},
    {"name": "Housing", "icon": Icons.house, "amount": 0.0, "color": Colors.purple},
    {"name": "Bills", "icon": Icons.receipt_long, "amount": 0.0, "color": Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        title: Text('Overview', style: GoogleFonts.poppins(color: theme.textTheme.titleLarge?.color)),
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.visibility, color: theme.iconTheme.color), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.settings, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildBalanceCard(context),
          SizedBox(height: 16),
          _buildAccountsCard(context),
          SizedBox(height: 16),
          _buildCashFlowCard(context),
          SizedBox(height: 16),
          _buildCategoriesCard(context),
          SizedBox(height: 16),
          _buildTransactionsCard(context),
          SizedBox(height: 16),
          _buildBudgetsCard(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: theme.bottomAppBarColor,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.unselectedWidgetColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Analytics"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Transactions"),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    final theme = Theme.of(context);
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, "Total Balance", trailing: Icon(Icons.filter_list, color: theme.iconTheme.color)),
          SizedBox(height: 12),
          Text("₹ ${balance.toStringAsFixed(0)}",
              style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600, color: theme.textTheme.headlineMedium?.color)),
          SizedBox(height: 4),
          Text("as of June 2025", style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildAccountsCard(BuildContext context) {
    final theme = Theme.of(context);
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, "Accounts", trailing: Icon(Icons.arrow_forward_ios, size: 16, color: theme.iconTheme.color)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _accountTile(context, Icons.wallet, "Cash", 0.0, Colors.teal),
              _accountTile(context, Icons.account_balance, "Bank", balance, Colors.indigo),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCashFlowCard(BuildContext context) {
    final theme = Theme.of(context);
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, "Cash Flow", subtitle: "June 2025", trailing: Icon(Icons.more_vert, color: theme.iconTheme.color)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _flowItem(context, "Income", income, Icons.arrow_upward, Colors.green),
              _flowItem(context, "Expense", expense, Icons.arrow_downward, Colors.red),
            ],
          ),
          Divider(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:", style: theme.textTheme.bodyMedium),
              Text("₹ ${(income - expense).toStringAsFixed(0)}", style: theme.textTheme.titleMedium),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesCard(BuildContext context) {
    final theme = Theme.of(context);
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, "Categories", subtitle: "June 2025", trailing: Icon(Icons.more_vert, color: theme.iconTheme.color)),
          SizedBox(height: 12),
          Column(
            children: categories.map((c) => ListTile(
              leading: CircleAvatar(
                backgroundColor: (c['color'] as Color).withOpacity(0.2),
                child: Icon(c['icon'] as IconData, color: c['color'] as Color),
              ),
              title: Text(c['name'], style: theme.textTheme.bodyLarge),
              trailing: Text("₹ ${(c['amount'] as double).toStringAsFixed(0)}", style: theme.textTheme.titleMedium),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsCard(BuildContext context) {
    final theme = Theme.of(context);
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            context,
            "Transactions",
            trailing: ValueListenableBuilder(
              valueListenable: _viewType,
              builder: (context, String view, _) => ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                constraints: BoxConstraints(minWidth: 80, minHeight: 30),
                isSelected: ["Daily", "Monthly"].map((e) => e == view).toList(),
                onPressed: (index) => _viewType.value = ["Daily", "Monthly"][index],
                children: const [
                  Text("Daily", style: TextStyle(fontSize: 12)),
                  Text("Monthly", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: transactions.map((tx) => ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4),
              leading: CircleAvatar(
                backgroundColor: (tx['color'] as Color).withOpacity(0.2),
                child: Icon(tx['icon'], color: tx['color']),
              ),
              title: Text(tx['category'], style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500)),
              subtitle: Text(tx['date'], style: theme.textTheme.bodySmall),
              trailing: Text(
                "${tx['type'] == "Income" ? "+" : "-"}₹${tx['amount']}",
                style: TextStyle(
                  color: tx['type'] == "Income" ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildBudgetsCard(BuildContext context) {
    return _themedCard(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(context, "Budgets", trailing: Icon(Icons.arrow_forward_ios, size: 16)),
          SizedBox(height: 16),
          Center(child: Text("No active budgets", style: Theme.of(context).textTheme.bodySmall)),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _themedCard({required BuildContext context, required Widget child}) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          if (theme.brightness == Brightness.light)
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(BuildContext context, String title, {String? subtitle, Widget? trailing}) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          if (subtitle != null)
            Text(subtitle, style: theme.textTheme.bodySmall),
        ]),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _accountTile(BuildContext context, IconData icon, String label, double amount, Color color) {
    final theme = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 8),
        Text(label, style: theme.textTheme.bodySmall),
        Text("₹ ${amount.toStringAsFixed(0)}", style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _flowItem(BuildContext context, String label, double amount, IconData icon, Color color) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        SizedBox(height: 4),
        Text(label, style: theme.textTheme.bodySmall),
        SizedBox(height: 4),
        Text("₹ ${amount.toStringAsFixed(0)}", style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

extension on ThemeData {
  get bottomAppBarColor => null;
}
