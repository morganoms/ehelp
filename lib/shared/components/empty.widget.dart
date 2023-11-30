import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({this.subtitle, super.key});

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/pasta-vazia.png',
          height: MediaQuery.of(context).size.height / 5,
        ),
        Text(
          subtitle ?? 'Nenhuma informação foi encontrado.',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
