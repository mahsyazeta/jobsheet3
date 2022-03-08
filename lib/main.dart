import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controllerInput = TextEditingController();

  double _inputUser = 0.0;
  double _kelvin = 0.0;
  double _reamur = 0.0;

  void konversi() {
    setState(() {
      _inputUser = double.parse(controllerInput.text);
      _kelvin = _inputUser + 273.15;
      _reamur = (_inputUser * 4) / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(controllerInput: controllerInput),
              Output(kelvin: _kelvin, reamur: _reamur),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: konversi,
                      child: Text(
                        'Konversi Suhu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Output extends StatelessWidget {
  const Output({
    Key? key,
    required double kelvin,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Suhu Dalam Kelvin'),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                '$_kelvin',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('Suhu Dalam Reamur'),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                '$_reamur',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controllerInput,
  }) : super(key: key);

  final TextEditingController controllerInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerInput,
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      keyboardType: TextInputType.number,
    );
  }
}