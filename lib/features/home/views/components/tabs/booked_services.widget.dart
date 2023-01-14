import 'package:flutter/material.dart';

import '../service_item.widget.dart';

class BookedServicesWidegt extends StatelessWidget {
  const BookedServicesWidegt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              2,
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
    );
  }
}
