import 'package:flutter/material.dart';
import 'package:flutter_konverter_suhu/convert.dart';
import 'package:flutter_konverter_suhu/dropdown.dart';
import 'package:flutter_konverter_suhu/input.dart';
import 'package:flutter_konverter_suhu/result.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  double _inputUser = 0;
  double _result = 0;
  String selectedDropdown = "Kelvin";
  List<String> listSatuanSuhu = ["Kelvin", "Reamur"];


  _konversiSuhu() {
    setState(() {
      if(etInput.text.isNotEmpty){
        _inputUser = double.parse(etInput.text);
        switch(selectedDropdown){
          case "Kelvin":
            {
              _result = _inputUser + 273;
              listHasil.add("Kelvin : " +
                            "$_result");
            }
            break;

          case "Reamur":
            {
              _result = _inputUser * 0.8;
              listHasil.add("Reamur : " +
                            "$_result");
            }
            break;
        }
      }
    });
  }
  _onDropdownChanged(Object? value){
    return setState(() {
      selectedDropdown = value.toString();
      _konversiSuhu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
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
            children: [
              Input(etInput: etInput),
              const SizedBox(height: 10,),
              Dropdown(
                selectedDropdown: selectedDropdown,
                listSatuanSuhu: listSatuanSuhu,
                onChangedDropdown: _onDropdownChanged,
              ),
              const SizedBox(height: 10,),
              const Text("Hasil", 
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 8,),
              Text("$_result",
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 25,),
              Convert(
                konvertHandler: _konversiSuhu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}