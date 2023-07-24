import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../../shared/fonts/styles.dart';

class GoToClientWidget extends StatelessWidget {
  const GoToClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Vá até o endereço do cliente para realizar o serviço'),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                height: 75,
                width: 75,
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/images/localization.webp',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rua Capitão Osvaldo Cruz',
                    style: FontStyles.size16Weight700,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'N 30, Santo Antonio.',
                    style: FontStyles.size14Weight500grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'São Paulo - SP',
                    style: FontStyles.size14Weight500,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
