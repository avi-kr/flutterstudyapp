import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  static const String routeName = "/questionscreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundDecoration(
        child: Center(child: Text("Yo!")),
      ),
    );
  }
}
