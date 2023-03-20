import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/model/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploaderController extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    // final firestore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionPaper = [];
    for (var paper in papersInAssets) {
      final stringPaperContent = await rootBundle.loadString(paper);
      questionPaper
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print('Item number ${questionPaper[0].id}');
    var batch = fireStore.batch();

    for (var paper in questionPaper) {
      batch.set(
        questionPaperRF.doc(paper.id),
        {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "Description": paper.description,
          "time_seconds": paper.timeSeconds,
          "question_count":
              paper.questions == null ? 0 : paper.questions!.length
        },
      );

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
      }
    }

    await batch.commit();
  }
}
