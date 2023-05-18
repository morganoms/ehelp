import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/features/login/view_models/login.view_model.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/input.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:ehelp/shared/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/colors/constants.dart';
import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/models/login_identification.dart';
import '../../../shared/models/user_type.dart';

class LoginView extends StatefulWidget {
  const LoginView({required this.userType, final Key? key}) : super(key: key);
  final UserType userType;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final LoginViewModel _viewModel = locator.get<LoginViewModel>();

  final LoginId identification =
      LoginId(username: 'email', password: 'password');

  @override
  void dispose() {
    locator.resetLazySingleton<LoginViewModel>();
    super.dispose();
  }

  String getTitle() {
    if (widget.userType == UserType.client) {
      return 'Login do Cliente';
    } else {
      return 'Login do Profissional';
    }
  }

  Future<void> onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _viewModel.authenticate(
          username: identification.username, password: identification.password);
      if (_viewModel.hasError) {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: false,
          animType: AnimType.rightSlide,
          title: 'Oops!',
          desc:
              'Nome de Usuário ou Senha inválido. Por favor, tente novamente.',
        ).show();
      } else {
        await Navigator.of(context).pushNamed(widget.userType == UserType.client
            ? EhelpRoutes.homeClient
            : EhelpRoutes.homeProfessional);
      }
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
                          height: 36,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Input(
                                label: const Text('Nome do usuário'),
                                onSaved: (username) =>
                                    identification.username = username!,
                                keyboardType: TextInputType.emailAddress,
                                validator: Validators.validateEmail,
                                icon: const Icon(Icons.person_outline),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Input(
                                label: const Text('Senha'),
                                onSaved: (senha) =>
                                    identification.password = senha!,
                                validator: Validators.emptyValidate,
                                isPasswordType: true,
                                icon: const Icon(Icons.vpn_key_outlined),
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
                        Observer(builder: (_) {
                          return GenericButton(
                              label: 'Continuar',
                              loading: _viewModel.isLoading,
                              color: ColorConstants.greenDark,
                              onPressed: () async {
                                await onSubmit(context);
                              });
                        }),
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
