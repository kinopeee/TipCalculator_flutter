import 'package:flutter/material.dart';

void main() {
  runApp(const TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  const TipCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipCalculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TipCalculatorHomePage(),
    );
  }
}

class TipCalculatorHomePage extends StatefulWidget {
  const TipCalculatorHomePage({super.key});

  @override
  State<TipCalculatorHomePage> createState() => _TipCalculatorHomePageState();
}

class _TipCalculatorHomePageState extends State<TipCalculatorHomePage> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  String _selectedCurrency = 'USD';
  double _tipPercentage = 10;
  double _tipAmount = 0;
  double _totalAmount = 0;
  double _yenAmount = 0;

  void _calculateTip() {
    final double billAmount = double.tryParse(_billController.text) ?? 0;
    _tipAmount = billAmount * _tipPercentage / 100;
    _totalAmount = billAmount + _tipAmount;
    _calculateInYen();
    setState(() {});
  }

  void _calculateInYen() {
    final double rate = double.tryParse(_rateController.text) ?? 0;
    _yenAmount = _totalAmount * rate;
  }

  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TipCalculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('チップ計算', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: _selectedCurrency,
                items: ['USD', 'EUR', 'JPY', 'AUD', 'CAD'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCurrency = newValue!;
                  });
                },
              ),
              TextField(
                controller: _billController,
                decoration: const InputDecoration(
                  labelText: '請求額',
                  hintText: '請求金額を入力',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _calculateTip(),
              ),
              Row(
                children: [
                  const Text('チップ率'),
                  Expanded(
                    child: Slider(
                      value: _tipPercentage,
                      min: 10,
                      max: 30,
                      divisions: 20,
                      label: '$_tipPercentage%',
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value;
                          _calculateTip();
                        });
                      },
                    ),
                  ),
                  Text('${_tipPercentage.toInt()}%'),
                ],
              ),
              Text('チップ金額: ${_tipAmount.toStringAsFixed(2)} $_selectedCurrency'),
              Text('合計金額: ${_totalAmount.toStringAsFixed(2)} $_selectedCurrency'),
              const SizedBox(height: 20),
              const Text('日本円換算', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                controller: _rateController,
                decoration: const InputDecoration(
                  labelText: '為替レート',
                  hintText: 'レートを入力',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _calculateTip(),
              ),
              Text('円換算額: ${_yenAmount.toStringAsFixed(0)} 円'),
            ],
          ),
        ),
      ),
    );
  }
}