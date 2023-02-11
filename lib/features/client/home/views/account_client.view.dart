import 'package:flutter/material.dart';

import 'components/header_section.widget.dart';

class AccaountView extends StatelessWidget {
  const AccaountView({Key? key}) : super(key: key);

  Widget _buildItem({
    required BuildContext context,
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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 36,
                child: Image.asset(
                  'assets/images/ehelp.png',
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Morgan Oliveira',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'morgansiqueir@gmail.com',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 75,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFD9D9D9),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox.expand(
                        child: FittedBox(
                          child: Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              const HeaderSectionWidget(
                title: 'Dados Pessoais',
              ),
              const SizedBox(
                height: 32,
              ),
              _buildItem(
                  context: context, title: 'CPF', value: '121.211.212-22'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(
                  context: context, title: 'Telefone', value: '81995210087'),
              const SizedBox(
                height: 32,
              ),
              const HeaderSectionWidget(
                title: 'Endereço',
              ),
              const SizedBox(
                height: 32,
              ),
              _buildItem(
                  context: context,
                  title: 'Logradouro',
                  value: 'Rua Almirante Pereira'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(context: context, title: 'Número', value: '30'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(
                  context: context,
                  title: 'Complemento',
                  value: 'Na frente do Shopping SP'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(
                  context: context, title: 'Bairro', value: 'Jardim Dourado'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(context: context, title: 'Cidade', value: 'São Paulo'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(context: context, title: 'Estado', value: 'São Paulo'),
              const SizedBox(
                height: 18,
              ),
              _buildItem(context: context, title: 'País', value: 'Brasil'),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
