import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:flutter/material.dart';

import 'components/service_item_client.widget.dart';

class HistoryProfessionalView extends StatelessWidget {
  const HistoryProfessionalView({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderBlack(
            titleLable: 'Histórico',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ServiceItemClientWidget(
                      indexImage: index % 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
