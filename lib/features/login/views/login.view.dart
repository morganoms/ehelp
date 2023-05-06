import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/input.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors/constants.dart';
import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/models/user_type.dart';

class LoginView extends StatelessWidget {
  LoginView({required this.userType, final Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final UserType userType;

  String getTitle() {
    if (userType == UserType.client) {
      return 'Login do Cliente';
    } else {
      return 'Login do Profissional';
    }
  }

  Widget _buildBottom() => Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child:
                  Text(' Entre Com: ', style: FontStyles.size16Weight700White),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.whiteBackground,
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConstants.whiteBackground,
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottom(),
      backgroundColor: ColorConstants.blackSoft,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      color: ColorConstants.whiteBackground,
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorConstants.whiteBackground),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          getTitle(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 27,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: const [
                              Input(
                                label: Text('Email'),
                                icon: Icon(Icons.email_outlined),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Input(
                                label: Text('Senha'),
                                icon: Icon(Icons.vpn_key_outlined),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorConstants.greenDark,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        GenericButton(
                          label: 'Continuar',
                          color: ColorConstants.greenDark,
                          onPressed: () => Navigator.of(context).pushNamed(
                              userType == UserType.client
                                  ? EhelpRoutes.homeClient
                                  : EhelpRoutes.homeProfessional),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            EhelpRoutes.personalData,
                            arguments: false,
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Não possui uma conta?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' Registre-se!',
                                    style: TextStyle(
                                      color: ColorConstants.greenDark,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.wavy,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
        ),
      ),
    );
  }
}
