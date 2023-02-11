import 'package:flutter/material.dart';

import '../service_item.widget.dart';

class HistoryServicesWidget extends StatelessWidget {
  const HistoryServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                10,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ServiceItemWidget(),
                    )),
          ],
        ),
      ),
    );
  }
}
