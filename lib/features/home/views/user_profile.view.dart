import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/fonts/styles.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '0.0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.star_purple500_outlined,
                        color: Colors.yellow.shade700,
                      )
                    ],
                  )
                ],
              ),
            ),
            Icon(
              Icons.person_rounded,
              color: const Color(0xFF575757),
              size: MediaQuery.of(context).size.height / 4,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            Flexible(
                              child: Text(
                                'Morgan Oliveira',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Flexible(
                              child: Text(
                                'Eletricista',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Qtd. serviços prestados',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Flexible(
                                  child: Text(
                                    '1.250',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Preço por Hora',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Flexible(
                                  child: Text(
                                    r'R$ 50,00',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 3),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Feedback',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: IconButton(
                                      onPressed: () => controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      ),
                                      icon: const Icon(
                                          Icons.arrow_back_ios_rounded),
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
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '“ Excelente profissional, muito rápido e resolveu o problema”',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: IconButton(
                                      onPressed: () => controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      ),
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GenericButton(
                                  label: 'Agendar',
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(
                                          EhelpRoutes.clientBookingStep1),
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
                                      .pushNamed(
                                          EhelpRoutes.clientCallNowPayment),
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
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
