import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/models/user_type.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset(
                  'assets/images/eletrician.jpg',
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 20,
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Bem Vindo',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Selecione abaixo o perfil em que deseja entrar no aplicativo.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 2),
                      child: const Divider(
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        EhelpRoutes.login,
                        arguments: UserType.client,
                      ),
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
                          'Cliente',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        EhelpRoutes.login,
                        arguments: UserType.professional,
                      ),
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
                          'Profissional',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
