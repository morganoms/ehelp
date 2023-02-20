import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/fonts/styles.dart';

class CreditCardClientView extends StatelessWidget {
  const CreditCardClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Adicionar novo cartão',
          color: Colors.transparent,
          labelStyle: FontStyles.size16Weight500blue,
          borderColor: ColorConstants.primaryLight,
          onPressed: () => Navigator.of(context).pushNamed(
            EhelpRoutes.clientCallNowPayment,
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              const HeaderBlack(
                titleLable: 'Cartões',
                iconBack: BackButtonWidget(),
              ),
              Padding(
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
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 36,
                                    child: Image.asset(
                                      'assets/images/mastercard.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'NuBank',
                                        style: FontStyles.size16Weight700,
                                      ),
                                      Text(
                                        '784568*****6565',
                                        style: FontStyles.size14Weight500grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: ColorConstants.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
