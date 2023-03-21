import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_study_app/model/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;

  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: model.imageUrl!,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/app_splash_logo.png"),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
