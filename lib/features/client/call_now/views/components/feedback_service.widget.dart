import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../shared/fonts/styles.dart';

class FeedbackServiceWidget extends StatelessWidget {
  const FeedbackServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Avalie o profissional',
          style: FontStyles.size20Weight700green,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
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
        )
      ],
    );
  }
}
