import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/input.widget.dart';
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
      return 'Entre com sua conta Profissional';
    }
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
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
                          color: ColorConstants.blueSelected,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    GenericButton(
                      label: 'Continuar',
                      color: ColorConstants.blueSelected,
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
                                  color: ColorConstants.blueSelected,
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
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      color: Colors.white,
                      child: Text(
                        ' Entre Com: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorConstants.primaryV2,
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
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorConstants.primaryV2,
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
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
