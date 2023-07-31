// ignore_for_file: must_be_immutable

import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/session/session.controller.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/Colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/random_person_image.widget.dart';
import '../../../../shared/entity/user/user.entity.dart';
import '../../../../shared/fonts/styles.dart';

class AccaountView extends StatelessWidget {
  AccaountView({Key? key}) : super(key: key) {
    user = locator.get<SessionController>().session!.userAuthenticated;
  }

  late User user;

  Widget _buildItem(
      {required String title,
      required String value,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: FontStyles.size16Weight700,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Editar perfil',
          color: ColorConstants.greenDark,
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(EhelpRoutes.personalData, arguments: true),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: 'Meu perfil',
              iconBack: BackButtonWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  RandomPersonImage(
                    heightImage: 150,
                    widthtImage: 150,
                    marginRight: false,
                    path: user.photoUrl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(user.name, style: FontStyles.size20Weight700),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(user.email, style: FontStyles.size16Weight400),
                  const SizedBox(
                    height: 48,
                  ),
                  _buildItem(
                      title: 'Nome Completo',
                      value: user.name,
                      context: context),
                  const SizedBox(height: 24),
                  _buildItem(
                      title: 'Documento',
                      value: user.documentNumber,
                      context: context),
                  const SizedBox(height: 24),
                  _buildItem(
                      title: 'Telefone', value: user.phone, context: context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
