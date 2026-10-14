import 'package:flutter/material.dart';
import 'database/database_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  final Color teal = const Color(0xFF438883);

  String? _transactionType = 'Expense';

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: teal),
      filled: true,
      fillColor: const Color(0xFFF7FAFA),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: teal.withValues(alpha: 0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: teal.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: teal, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  Future<void> saveTransaction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final transaction = {
      'type': _transactionType!,
      'name': _nameController.text.trim(),
      'amount': double.parse(_amountController.text.trim()),
      'date': _dateController.text,
    };

    try {
      await _dbHelper.insertTransaction(transaction);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaction saved successfully!')),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to save transaction: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        centerTitle: true,
        backgroundColor: teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TRANSACTION TYPE',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    initialValue: _transactionType,
                    decoration: fieldDecoration(
                      'Transaction type',
                      Icons.swap_vert_rounded,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Expense',
                        child: Text('Expense'),
                      ),
                      DropdownMenuItem(value: 'Income', child: Text('Income')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a transaction type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _transactionType = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'NAME',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: fieldDecoration(
                      'Enter transaction name',
                      Icons.edit_note_rounded,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a transaction name';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must contain at least 2 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'AMOUNT',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: fieldDecoration(
                      'Enter amount',
                      Icons.currency_rupee_rounded,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an amount';
                      }

                      final amount = double.tryParse(value.trim());

                      if (amount == null || !amount.isFinite || amount <= 0) {
                        return 'Enter a valid amount greater than zero';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'DATE',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: fieldDecoration(
                      'Select transaction date',
                      Icons.calendar_month_rounded,
                    ),
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );

                      if (selectedDate != null) {
                        _dateController.text =
                            '${selectedDate.day.toString().padLeft(2, '0')}/'
                            '${selectedDate.month.toString().padLeft(2, '0')}/'
                            '${selectedDate.year}';
                      }
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: saveTransaction,
                      style: FilledButton.styleFrom(
                        backgroundColor: teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Save Transaction',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
