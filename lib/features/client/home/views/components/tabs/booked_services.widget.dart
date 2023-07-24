import 'package:flutter/material.dart';

import '../../../model/entity/service_for_client.entity.dart';
import '../service_item.widget.dart';

class BookedServicesWidegt extends StatelessWidget {
  const BookedServicesWidegt({required this.screenData, Key? key})
      : super(key: key);

  final List<ServiceForClientEntity> screenData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...screenData.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ServiceItemWidget(
                  expansive: true,
                  indexImage: 5,
                  cardData: e,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
