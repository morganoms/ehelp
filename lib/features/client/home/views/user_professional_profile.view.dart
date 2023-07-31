import 'package:carousel_slider/carousel_slider.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/random_person_image.widget.dart';
import 'package:ehelp/shared/utils/money.formatter.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/start_score.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../model/entity/service_for_client.entity.dart';

class UserProfessionalProfileView extends StatelessWidget {
  UserProfessionalProfileView({required this.serviceForClientEntity, Key? key})
      : super(key: key);
  final PageController controller = PageController();
  final ServiceForClientEntity serviceForClientEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBlack(
            titleLable: 'Perfil do Profissional',
            iconBack: BackButtonWidget(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: ColorConstants.blackSoft,
              padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
              child: SegmentedButton(
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll<BorderSide>(BorderSide(
                    color: ColorConstants.primaryColor,
                  )),
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    ColorConstants.primaryColor,
                  ),
                  foregroundColor: MaterialStatePropertyAll<Color>(
                    Colors.white,
                  ),
                ),
                segments: const [
                  ButtonSegment(
                      value: '1',
                      label: Text('Agendar'),
                      icon: Icon(Icons.calendar_month)),
                  ButtonSegment(
                      value: '2',
                      label: Text('Chamar Agora'),
                      icon: Icon(Icons.call))
                ],
                selected: const <String>{'3'},
                onSelectionChanged: (Set<String> p0) {
                  if (p0.first == '1') {
                    Navigator.of(context).pushNamed(
                        EhelpRoutes.clientBookingStep1,
                        arguments: serviceForClientEntity.userId);
                  } else {
                    Navigator.of(context)
                        .pushNamed(EhelpRoutes.clientCallNowDescription);
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RandomPersonImage(
                      heightImage: 150,
                      widthtImage: 150,
                      marginRight: false,
                      path: serviceForClientEntity.photoUrl,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(serviceForClientEntity.name,
                        style: FontStyles.size20Weight700),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(serviceForClientEntity.descriptionPortuguese,
                        style: FontStyles.size16Weight400),
                    const SizedBox(
                      height: 16,
                    ),
                    StarScore(value: serviceForClientEntity.rating),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.primaryLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Serviços',
                                  style: FontStyles.size14Weight500grey,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    serviceForClientEntity.servicesDoneAmount
                                        .toString(),
                                    style: FontStyles.size16Weight700),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Valor por Hora',
                                    style: FontStyles.size14Weight500grey),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    Money.format(
                                        serviceForClientEntity.minValue),
                                    style: FontStyles.size16Weight700),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text('Feedback', style: FontStyles.size18Weight700),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 60,
                      ),
                      items: [
                        '“ Excelente profissional, muito rápido e resolveu o problema”',
                        '“ Excelente profissional, muito rápido e resolveu o problema”',
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  i.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
