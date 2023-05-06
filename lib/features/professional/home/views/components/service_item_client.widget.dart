import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../routes/ehelp_routes.dart';
import '../../../../../shared/components/random_person_image.widget.dart';

class ServiceItemClientWidget extends StatelessWidget {
  const ServiceItemClientWidget({required this.indexImage, Key? key})
      : super(key: key);
  final int indexImage;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(EhelpRoutes.callDetail, arguments: true),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(24),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: RandomPersonImage(
                            indexImage: indexImage,
                            heightImage: 55,
                            widthtImage: MediaQuery.of(context).size.width / 7,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Morgan Oliveira',
                                  style: FontStyles.size16Weight700),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  'Rua Capitão Osvaldo Cruz, N 30, Bairro Santo Antonio',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontStyles.size14Weight300grey),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Flexible(
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorConstants.greenDark,
                      size: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  'Problema de fio desencapado devido a acidente domestico. Preciso de atendimento urgente.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.size14Weight300),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorConstants.blackSoft),
                        child: Text('Pendente',
                            style: FontStyles.size14Weight400white)),
                  ),
                  Text('21 de março, as 09 : 30',
                      style: FontStyles.size14Weight500),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
