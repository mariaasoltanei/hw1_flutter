import 'package:flutter/material.dart';

void main() {
  runApp(const FirstHW());
}

class FirstHW extends StatelessWidget {
  const FirstHW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConvertorApp(),
    );
  }
}

class ConvertorApp extends StatefulWidget {
  const ConvertorApp({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<ConvertorApp> {
  late String valueInEUR = '0';
  final valueController = TextEditingController();
  bool validationFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Currency convertor"),
          actions: const [Icon(Icons.all_inclusive_rounded)],
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
            child: Column(children: [
          Image.network(
            "https://as1.ftcdn.net/v2/jpg/04/29/83/38/1000_F_429833896_e7Ycw6xmAI6OxKkXGMNu1vFseIl0P7ht.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter the amount in EUR',
                  errorText: validationFlag ? 'Enter a valid number' : null)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {
              if (valueController.text.isEmpty ||
                  valueController.text.contains(RegExp(r'[a-z]')) ||
                  valueController.text.contains(RegExp(r'[A-Z]')) ||
                  valueController.text.contains(RegExp(r'[#?!@,.$%^&*-]'))) {
                setState(() {
                  validationFlag = true;
                });
              } else {
                setState(() {
                  validationFlag = false;
                  valueInEUR = (int.parse(valueController.text) * 4.95).toStringAsFixed(2);
                });
              }
            },
            child: const Text('Convert'),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              valueInEUR,
              style: const TextStyle(fontSize: 30, color: Colors.blueGrey),
            ),
          )
        ])));
  }
}
