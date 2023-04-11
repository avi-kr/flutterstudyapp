import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/costom_text_styles.dart';
import 'package:flutter_study_app/controller/question_papers/questions_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:flutter_study_app/widgets/common/question_placeholder.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
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
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                    child: ContentArea(child: QuestionScreenHolder())),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(controller.currentQuestion.value!.question,
                          style: questionText,),
                        ],
                      ),
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
