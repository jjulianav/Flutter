import 'package:devQuiz/core/app_widget.dart';
import 'package:devQuiz/home/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage(Key? key)
      : super(key: key); // ? - significa que a variavle pode ser nula
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
    );
  }
}
