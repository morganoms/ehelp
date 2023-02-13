import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:flutter/material.dart';
import '../../../../shared/Colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/random_person_image.widget.dart';
import '../../../../shared/fonts/styles.dart';

class ProfileProfessionalView extends StatefulWidget {
  const ProfileProfessionalView({Key? key}) : super(key: key);

  @override
  State<ProfileProfessionalView> createState() =>
      _ProfileProfessionalViewState();
}

class _ProfileProfessionalViewState extends State<ProfileProfessionalView> {
  Widget _buildItem({
    required String title,
    required String value,
  }) {
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
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Stack(
              children: [
                const HeaderBackground(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const BackButtonWidget(),
                            const SizedBox(width: 24),
                            Text('Meu perfil',
                                style: FontStyles.size18Weight500),
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
                        Text('Morgan Oliveira',
                            style: FontStyles.size20Weight700),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('morganoms@hotmail.com',
                            style: FontStyles.size16Weight400),
                        const SizedBox(
                          height: 48,
                        ),
                        _buildItem(
                            title: 'Nome Completo',
                            value: 'Morgan Oliveira melo de Siqueira'),
                        const SizedBox(height: 24),
                        _buildItem(title: 'CPF', value: '121.211.212-22'),
                        const SizedBox(height: 24),
                        _buildItem(title: 'Telefone', value: '(81) 99521-0087'),
                        const SizedBox(height: 24),
                        _buildItem(title: 'Aniversário', value: '22/01/1998'),
                        const SizedBox(height: 24),
                        _buildItem(title: 'Genero', value: 'Masculino'),
                        const SizedBox(height: 24),
                        const Spacer(flex: 2),
                        GenericButton(
                          label: 'Editar perfil',
                          color: Colors.transparent,
                          labelStyle: FontStyles.size16Weight500blue,
                          borderColor: ColorConstants.primaryLight,
                          onPressed: () => Navigator.of(context).pushNamed(
                              EhelpRoutes.personalData,
                              arguments: true),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
