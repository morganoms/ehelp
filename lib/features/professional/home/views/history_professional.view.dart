import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/fonts/styles.dart';
import '../../../client/home/views/components/service_item.widget.dart';

class HistoryProfessionalView extends StatelessWidget {
  const HistoryProfessionalView({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [ColorConstants.primaryV2, Colors.white],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Histórico',
                    style: FontStyles.size20Weight400,
                  ),
                  const SizedBox(height: 48),
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ServiceItemWidget(
                        expansive: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
