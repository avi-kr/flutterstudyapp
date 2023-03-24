import 'package:flutter_study_app/model/question_paper_model.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print(_questionPaper.title);
    super.onReady();
  }
}
