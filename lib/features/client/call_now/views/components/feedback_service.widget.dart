import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../shared/components/input.widget.dart';

class FeedbackServiceWidget extends StatelessWidget {
  const FeedbackServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          minRating: 0.5,
          allowHalfRating: true,
          unratedColor: ColorConstants.primaryLight,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Input(
            label: const Text('Deixe um feedback'),
            maxLines: 5,
            borderRadius: BorderRadius.circular(20))
      ],
    );
  }
}
