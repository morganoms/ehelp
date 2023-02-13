import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/random_person_image.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/start_score.widget.dart';
import '../../../../shared/fonts/styles.dart';

class UserProfessionalProfileView extends StatelessWidget {
  UserProfessionalProfileView({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [ColorConstants.primaryV2, Colors.white],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BackButtonWidget(),
                    StarScore(),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                const RandomPersonImage(
                  heightImage: 150,
                  widthtImage: 150,
                  marginRight: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: Text('Morgan Oliveira',
                      style: FontStyles.size20Weight700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                  child: Text('Eletricista', style: FontStyles.size16Weight400),
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.primaryV2),
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
                            Text('1.250', style: FontStyles.size16Weight700),
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
                            Text(r'R$ 50,00',
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
                  child: Text('Feedback', style: FontStyles.size18Weight700),
                ),
                const SizedBox(
                  height: 24,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: IconButton(
                          onPressed: () => controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          icon: const Icon(Icons.arrow_back_ios_rounded),
                        ),
                      ),
                      Flexible(
                        flex: 10,
                        child: PageView(
                          controller: controller,
                          children: [
                            Text(
                              '“ Excelente profissional, muito rápido e resolveu o problema”',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '“ Excelente profissional, muito rápido e resolveu o problema”',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenericButton(
                      label: 'Agendar',
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EhelpRoutes.clientBookingStep1),
                      height: 25,
                      width: MediaQuery.of(context).size.width / 5,
                      labelStyle: FontStyles.size14Weight500,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    GenericButton(
                      label: 'Chamar Agora',
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EhelpRoutes.clientCallNowDescription),
                      height: 25,
                      color: const Color(0xFF575757),
                      width: MediaQuery.of(context).size.width / 3,
                      labelStyle: FontStyles.size14Weight500,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
