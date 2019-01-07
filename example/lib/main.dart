import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rounded_letter/click_listener.dart';
import 'package:rounded_letter/rounded_letter.dart';
import 'package:rounded_letter/shape_type.dart';
import 'package:rounded_letter_example/divider_painter.dart';

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
  SampleClickListener listener = new SampleClickListener();

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
    widgets.addAll(buildDivider("Rectangles", "Example rectangle shapes"));
    widgets.add(_getRowWithRectangles());
    widgets.addAll(buildDivider("Triangles", "Example triangle shapes"));
    widgets.add(_getRowWithTriangles());
    widgets.addAll(buildDivider("Pentagons", "Example pentagon shapes"));
    widgets.add(_getRowWithPentagons());
    widgets.addAll(buildDivider("Hexagons", "Example hexagon shapes"));
    widgets.add(_getRowWithHexagons());
    widgets.addAll(
        buildDivider("Italic/bold", "Example shapes with italic/bold text"));
    widgets.add(_getRowWithDifferentFontStyles());
    widgets.addAll(
        buildDivider("Clickable element", "Example clickable shape. Click result is printed to console"));
    widgets.add(_getRowWithClickableExample());
    widgets.addAll(buildDivider("Default circles", "Example circles"));
    for (var i = 0; i < 50; i++) {
      widgets.add(getRow());
    }
    return ListView(children: widgets);
  }

  List<Widget> buildDivider(String text, String subtitle) {
    List<Widget> widgets = new List();

    widgets.add(Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)));
    widgets.add(Center(child: Text(text, style: TextStyle(fontSize: 20))));
    widgets.add(Center(child: Text(subtitle, style: TextStyle(fontSize: 12))));
    widgets.add(Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)));
    widgets.add(Container(child: CustomPaint(painter: DividerPainter())));
    widgets.add(Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)));
    return widgets;
  }

  Widget _getRowWithRectangles() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
            RoundedLetter(
              text: "JH",
              shapeColor: Color(0xFFF4511E),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFFBF360C),
              borderWidth: 1,
              key: Key("Rectangle1"),
              clickListener: listener,
            ),
            RoundedLetter(
              text: "Mw",
              shapeColor: Color(0xFF689F38),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFF33691E),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "VB",
              shapeColor: Color(0xFF039BE5),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFF01579B),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "O",
              shapeColor: Color(0xFF00897B),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFF004D40),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "X",
              shapeColor: Color(0xFF5E35B1),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFF311B92),
              borderWidth: 1,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
          ],
        ));
  }

  Widget _getRowWithTriangles() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
            RoundedLetter(
              text: "EF",
              shapeColor: Color(0xFFF4511E),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFFBF360C),
              borderWidth: 1,
              fontSize: 15,
            ),
            RoundedLetter(
              text: "HH",
              shapeColor: Color(0xFF689F38),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFF33691E),
              borderWidth: 1,
              fontSize: 15,
            ),
            RoundedLetter(
              text: "Yt",
              shapeColor: Color(0xFF039BE5),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFF01579B),
              borderWidth: 1,
              fontSize: 15,
            ),
            RoundedLetter(
              text: "P",
              shapeColor: Color(0xFF00897B),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFF004D40),
              borderWidth: 1,
              fontSize: 15,
            ),
            RoundedLetter(
              text: "J",
              shapeColor: Color(0xFF5E35B1),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFF311B92),
              borderWidth: 1,
              fontSize: 15,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
          ],
        ));
  }

  Widget _getRowWithPentagons() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
            RoundedLetter(
              text: "ED",
              shapeColor: Color(0xFFF4511E),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFFBF360C),
              borderWidth: 1,
              key: Key("Rectangle1"),
              clickListener: listener,
            ),
            RoundedLetter(
              text: "AB",
              shapeColor: Color(0xFF689F38),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFF33691E),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "Rd",
              shapeColor: Color(0xFF039BE5),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFF01579B),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "M",
              shapeColor: Color(0xFF00897B),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFF004D40),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "C",
              shapeColor: Color(0xFF5E35B1),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFF311B92),
              borderWidth: 1,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
          ],
        ));
  }

  Widget _getRowWithHexagons() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
            RoundedLetter(
              text: "Kl",
              shapeColor: Color(0xFFF4511E),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFFBF360C),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "FG",
              shapeColor: Color(0xFF689F38),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFF33691E),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "RH",
              shapeColor: Color(0xFF039BE5),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFF01579B),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "A",
              shapeColor: Color(0xFF00897B),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFF004D40),
              borderWidth: 1,
            ),
            RoundedLetter(
              text: "N",
              shapeColor: Color(0xFF5E35B1),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFF311B92),
              borderWidth: 1,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
          ],
        ));
  }

  Widget _getRowWithDifferentFontStyles() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
            RoundedLetter(
              text: "AB",
              shapeColor: Color(0xFFF4511E),
              shapeType: ShapeType.circle,
              borderColor: Color(0xFFBF360C),
              borderWidth: 1,
              fontBold: true,
            ),
            RoundedLetter(
              text: "Ac",
              shapeColor: Color(0xFF689F38),
              shapeType: ShapeType.rectangle,
              borderColor: Color(0xFF33691E),
              borderWidth: 1,
              fontItalic: true,
            ),
            RoundedLetter(
              text: "O",
              shapeColor: Color(0xFF039BE5),
              shapeType: ShapeType.triangle,
              borderColor: Color(0xFF01579B),
              borderWidth: 1,
              fontBold: true,
              fontItalic: true,
            ),
            RoundedLetter(
              text: "N",
              shapeColor: Color(0xFF00897B),
              shapeType: ShapeType.pentagon,
              borderColor: Color(0xFF004D40),
              borderWidth: 1,
              fontBold: true,
            ),
            RoundedLetter(
              text: "r",
              shapeColor: Color(0xFF5E35B1),
              shapeType: ShapeType.hexagon,
              borderColor: Color(0xFF311B92),
              borderWidth: 1,
              fontItalic: true,
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
          ],
        ));
  }

  Widget _getRowWithClickableExample() {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedLetter(
                text: "CL",
                shapeColor: Color(0xFFF4511E),
                shapeType: ShapeType.circle,
                borderColor: Color(0xFFBF360C),
                borderWidth: 1,
                shapeSize: 80,
                fontSize: 40,
                fontBold: true,
                key: Key("clickable_circle"),
                clickListener: SampleClickListener(),
              ),
            ]));
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

class SampleClickListener extends ClickListener {
  @override
  onClick(Key key) {
    print("Clicked on " + key.toString());
  }
}
