
import 'package:flutter/material.dart';


const Color _customColor = Color.fromARGB(255, 162, 122, 226);

// List colors
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.red,
  Colors.orangeAccent


];

class AppTheme {
  final int selectorColor;

  AppTheme({
    this.selectorColor = 2
    }):assert( selectorColor >=0 && selectorColor <= _colorThemes.length -1, 'Colors must between 0 and  ${_colorThemes.length}');

  ThemeData theme() {

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectorColor],
    );
  }
}