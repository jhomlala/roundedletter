# :star2: Rounded Letter

[![pub package](https://img.shields.io/pub/v/rounded_letter.svg)](https://github.com/jhomlala/roundedletter)

Letter inside circle. Can be used for placeholders.

##  Install

```yaml
dependencies:
  rounded_letter: ^0.0.1
```

###  Import

```dart
import 'package:rounded_letter/rounded_letter.dart';
```

###  Usage

```dart
//minimal example, with default circle size = 40, letter font size = 20 and blue color
RoundedLetter(letter: "A");

//circle with red color and circle size = 40 and letter font size = 20
RoundedLetter.withRedCircle("B", 40, 20);

//circle with green color and circle size = 40 and letter font size = 20
RoundedLetter.withGreenCircle("C", 40, 20);

//circle with blue color and circle size = 40 and letter font size = 20
RoundedLetter.withBlueCircle("D", 40, 20);
```

### Screenshots

<p align="center">
  <img width="30%" height="30%" src="https://github.com/jhomlala/roundedletter/blob/master/screenshots/screenshot1.png">
</p>
