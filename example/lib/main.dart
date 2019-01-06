import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rounded_letter/rounded_letter.dart';
import 'package:rounded_letter/shape_type.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    names.add("Tom");
    names.add("Mike");
    names.add("Bob");
    names.add("Ross");
    names.add("Joey");
    names.add("Thomas");
    names.add("Harry");
    names.add("Percy");
    names.add("Yvone");
    names.add("Xavier");
    names.add("Zac");
    surnames.add("Callinan");
    surnames.add("Mcgrath");
    surnames.add("Luster");
    surnames.add("Kasten");
    surnames.add("Maione");
    surnames.add("Heyeck");
  }

  Random _random = new Random();
  List<String> names = List();
  List<String> surnames = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Rounded Letter'),
            ),
            body: Container(child: getListWithRoundedLetters())));
  }

  Widget getListWithRoundedLetters() {
    List<Widget> widgets = new List();
    widgets.add(_getRowWithRectangles());
    widgets.add(_getRowWithTriangles());
    for (var i = 0; i < 50; i++) {
      widgets.add(getRow());
    }
    return ListView(children: widgets);
  }

  Widget _getRowWithRectangles() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 0, 188, 212),
              shapeType: ShapeType.rectangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 27, 94, 32),
              shapeType: ShapeType.rectangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 245, 127, 23),
              shapeType: ShapeType.rectangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ), Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "J",
              shapeColor: Color.fromARGB(255, 205, 220, 57),
              shapeType: ShapeType.rectangle,
            ), Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "H",
              shapeColor: Color.fromARGB(255, 41, 98, 255 ),
              shapeType: ShapeType.rectangle,
            )
          ],
        ));
  }

  Widget _getRowWithTriangles() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 0, 188, 212),
              shapeType: ShapeType.triangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 27, 94, 32),
              shapeType: ShapeType.triangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color.fromARGB(255, 245, 127, 23),
              shapeType: ShapeType.triangle,
              borderColor: Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2,
            ), Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "J",
              shapeColor: Color.fromARGB(255, 205, 220, 57),
              shapeType: ShapeType.triangle,
            ), Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
            RoundedLetter(
              text: "H",
              shapeColor: Color.fromARGB(255, 41, 98, 255 ),
              shapeType: ShapeType.triangle,
            )
          ],
        ));
  }

  Widget getRow() {
    var name = _getRandomName();
    var surname = _getRandomSurname();
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
          _getRandomColorRoundedLetter(name.substring(0, 1).toUpperCase()),
          Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
          Text(name + " " + surname)
        ]));
  }

  String _getRandomName() {
    return names[_random.nextInt(names.length)];
  }

  String _getRandomSurname() {
    return surnames[_random.nextInt(surnames.length)];
  }

  RoundedLetter _getRandomColorRoundedLetter(String letter) {
    RoundedLetter roundedLetter;
    switch (_random.nextInt(3)) {
      case 0:
        roundedLetter = RoundedLetter.withRedCircle(letter, 40, 20);

        break;
      case 1:
        roundedLetter = RoundedLetter.withGreenCircle(letter, 40, 20);
        break;
      case 2:
        roundedLetter = RoundedLetter.withBlueCircle(letter, 40, 20);
        break;
      default:
        roundedLetter = new RoundedLetter(text: letter);
    }
    return roundedLetter;
  }
}
