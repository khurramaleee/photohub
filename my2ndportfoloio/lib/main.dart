import 'package:my2ndportfoloio/pages/home_page.dart';
import 'package:my2ndportfoloio/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:my2ndportfoloio/tabs/about_tab.dart' as tab;
import 'config/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialDarkModeOn: true,
      child: Adityadroid(),
    );
  }
}
class Adityadroid extends StatelessWidget {
  const Adityadroid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khurram Ali',
      theme:ThemeSwitcher.of(context).isDarkModeOn?darkTheme(context):lightTheme(context),
      home: HomePage(),
    );
  }
}
