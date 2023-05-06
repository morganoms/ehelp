import 'package:flutter/material.dart';

import '../../../../../shared/colors/constants.dart';
import '../../../../../shared/components/random_person_image.widget.dart';

class CardDetailServiceWidget extends StatelessWidget {
  CardDetailServiceWidget({this.onTap, this.isClient = false, Key? key})
      : super(key: key);
  final bool isClient;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: -5,
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 24, left: 16, top: 24, bottom: 24),
            child: Row(
              children: [
                RandomPersonImage(
                  widthtImage: MediaQuery.of(context).size.width / 5,
                ),
                Flexible(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            isClient ? 'Cliente' : 'Profissional',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Morgan Oliveira',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Flexible(
                          child: Text(
                            'Detalhes do Chamado',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.greenDark,
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
