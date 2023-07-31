import 'package:ehelp/core/locator.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:ehelp/shared/components/person_picture.widget.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../shared/fonts/styles.dart';
import '../../home/view_model/home_professional.view_model.dart';

class CallDetailProfessionalView extends StatelessWidget {
  CallDetailProfessionalView({this.isClient = true, Key? key})
      : super(key: key);

  final bool isClient;

  final HomeProfessionalViewModel _viewModel =
      locator.get<HomeProfessionalViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorConstants.whiteBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: GenericButton(
                  label: 'Cancelar',
                  onPressed: () => Navigator.of(context).pop(),
                  borderColor: ColorConstants.greenDark,
                  labelStyle: FontStyles.size16Weight700black,
                  color: Colors.transparent,
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: GenericButton(
                  label: 'Confirmar',
                  onPressed: () => Navigator.of(context)
                      .pushNamed(EhelpRoutes.callNowProfessional),
                  color: ColorConstants.greenDark,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          HeaderBlack(
            titleLable: 'Detalhe do Chamado',
            iconBack: BackButtonWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
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
                const SizedBox(height: 48),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    ...List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            height: 150,
                            placeholder: MemoryImage(kTransparentImage),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/detail$index.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isClient ? 'Cliente' : 'Profissional',
                    style: FontStyles.size16Weight400,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(EhelpRoutes.professionalProfile),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const PersonPicture(),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Armando Silva',
                                style: FontStyles.size16Weight700,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '(81) 8765-5321',
                                style: FontStyles.size16Weight400,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: ColorConstants.greenDark,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Problema de fio desencapado devido a acidente domestico. Preciso de concerto urgente.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
