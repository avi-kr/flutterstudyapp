import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/controller/question_papers/questions_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:get/get.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({Key? key}) : super(key: key);

  static const String routeName = "/questionscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Center(
            child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
