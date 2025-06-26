import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance_tracker/auth/auth_cubit.dart';
import 'package:personal_finance_tracker/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthCubit>().logout(),
          ),
        ],
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return _buildDashboard(state.user);
          } else if (state is AuthUnauthenticated) {
            return _buildUnauthenticatedView(context);
          } else if (state is AuthFailure) {
            return _buildErrorView(context, state.error); //

          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDashboard(firebase_auth.User user) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome ${user.email?.split('@')[0]}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // Add your dashboard widgets here
          _buildFinancialSummary(),
          const SizedBox(height: 20),
          _buildRecentTransactions(),
        ],
      ),
    );
  }

  Widget _buildFinancialSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Monthly Summary', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAmountIndicator('Income', '\$2,450', Colors.green),
                _buildAmountIndicator('Expenses', '\$1,890', Colors.red),
                _buildAmountIndicator('Balance', '\$560', Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountIndicator(String label, String amount, Color color) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent Transactions', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text('Food & Dining'),
                  subtitle: const Text('June 25, 2023'),
                  trailing: const Text('\$45.00',
                      style: TextStyle(color: Colors.red)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnauthenticatedView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You are not logged in'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to login screen
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text('Error: $error', style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().checkAuthStatus(); // ✅ Now works
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

}