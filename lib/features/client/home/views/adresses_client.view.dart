import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/Colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/fonts/styles.dart';

class AdressesClientView extends StatefulWidget {
  const AdressesClientView({Key? key}) : super(key: key);

  @override
  State<AdressesClientView> createState() => _AdressesClientViewState();
}

class _AdressesClientViewState extends State<AdressesClientView> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: HeaderBlack(
              titleLable: 'Endereços',
              iconBack: BackButtonWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Casa',
                              style: FontStyles.size16Weight700,
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: ColorConstants.primaryColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Rua Capitão Osvaldo Cruz, N 30',
                          style: FontStyles.size14Weight500grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '52378-98',
                          style: FontStyles.size14Weight500grey,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: ColorConstants.greenStrong,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Endereço principal',
                              style: FontStyles.size14Weight500,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomCenter,
              child: GenericButton(
                label: 'Adicionar novo endereço',
                color: Colors.transparent,
                labelStyle: FontStyles.size16Weight500blue,
                borderColor: ColorConstants.primaryLight,
                onPressed: () => Navigator.of(context).pushNamed(
                    EhelpRoutes.addressProfessional,
                    arguments: true),
              ),
            ),
          )
        ],
      ),
    );
  }
}
