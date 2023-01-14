import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    getTitle(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 27,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(EhelpRoutes.homeClient),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Ainda não possui uma conta? Registre-se',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color(0xFF707070), width: 0.5)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.red, width: .5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.vpn_key_outlined),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color(0xFF707070), width: 0.5)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.red, width: .5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(EhelpRoutes.homeClient),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: const Color(0xFF575757),
                    shadowColor: Colors.transparent.withOpacity(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.maxFinite,
                    child: const Text(
                      'Continuar',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      color: Colors.white,
                      child: Text(
                        ' ou ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide()),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 25,
                        ),
                        const Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Continuar com o Google',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: const Color(0xFF3a5897),
                    shadowColor: Colors.transparent.withOpacity(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/facebook.png',
                          height: 25,
                        ),
                        const Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Continuar com o Facebook',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
