# :star2: Rounded Letter

[![pub package](https://img.shields.io/pub/v/rounded_letter.svg)](https://pub.dartlang.org/packages/rounded_letter)

Useful Flutter widget which allows you to create letter inside shape. Can be used for placeholders (for example user avatars).

This package is named 'Rounded letter' because main idea was letter inside circle just like Android 5.0 contacts. Later idea has evolved into more shapes.

## :raised_hands:Features 
:heavy_check_mark: 5 shapes: Circle(default), Triangle, Rectangle, Pentagon, Hexagon  
:heavy_check_mark: Customizable shape size and color, text size and color  
:heavy_check_mark: Support for 1 and 2 letter(s)  
:heavy_check_mark: Shape border  
:heavy_check_mark: Support for gesture detection

## :electric_plug: Install

```yaml
dependencies:
  rounded_letter: ^0.0.6
```

### :bulb: Import

```dart
import 'package:rounded_letter/rounded_letter.dart';
```
### :camera: Screenshots 

<table>
  <tr>
    <td>
  <img width="250px" src="https://github.com/jhomlala/roundedletter/blob/master/screenshots/screenshot_1.png">
    </td>
    <td>
       <img width="250px" src="https://github.com/jhomlala/roundedletter/blob/master/screenshots/screenshot_2.png">
    </td>
    <td>
       <img width="250px" src="https://github.com/jhomlala/roundedletter/blob/master/screenshots/screenshot_3.png">
    </td>
    <td>
       <img width="250px" src="https://github.com/jhomlala/roundedletter/blob/master/screenshots/screenshot_4.png">
    </td>
  </tr>
  
</table>

### :question: Usage

```dart
//minimal example, with default circle size = 40, letter font size = 20 and blue color
RoundedLetter(letter: "A");

//circle with red color and circle size = 40 and letter font size = 20
RoundedLetter.withRedCircle("B", 40, 20);

//circle with green color and circle size = 40 and letter font size = 20
RoundedLetter.withGreenCircle("C", 40, 20);

//circle with blue color and circle size = 40 and letter font size = 20
RoundedLetter.withBlueCircle("D", 40, 20);

//rectangle
RoundedLetter(
      text: "JH",
      shapeColor: Color.fromARGB(255, 245, 127, 23),
      shapeType: ShapeType.rectangle,
      borderColor: Color.fromARGB(255, 0, 0, 0),
      borderWidth: 2,
    );

//triangle
RoundedLetter(
      text: "JH",
      shapeColor: Color.fromARGB(255, 245, 127, 23),
      shapeType: ShapeType.triangle,
      borderColor: Color.fromARGB(255, 0, 0, 0),
      borderWidth: 2,
    );
    
//pentagon
RoundedLetter(
      text: "JH",
      shapeColor: Color.fromARGB(255, 245, 127, 23),
      shapeType: ShapeType.pentagon,
      borderColor: Color.fromARGB(255, 0, 0, 0),
      borderWidth: 2,
    );
    
//hexagon
RoundedLetter(
      text: "JH",
      shapeColor: Color.fromARGB(255, 245, 127, 23),
      shapeType: ShapeType.hexagon,
      borderColor: Color.fromARGB(255, 0, 0, 0),
      borderWidth: 2,
    );
    
//full example:
RoundedLetter(
      text: "JH",
      shapeType: ShapeType.rectangle,
      fontColor: Color.fromARGB(255,255,255,255),
      shapeColor: Color.fromARGB(255, 245, 127, 23),
      shapeSize: 40,
      fontSize: 20,
      borderWidth: 2,
      borderColor: Color.fromARGB(255, 0, 0, 0),
    );
```


