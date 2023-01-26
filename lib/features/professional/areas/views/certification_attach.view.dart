import 'package:ehelp/locator.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_edit_area.view_model.dart';

class CertificationAttachView extends StatefulWidget {
  const CertificationAttachView({Key? key}) : super(key: key);

  @override
  State<CertificationAttachView> createState() =>
      _CertificationAttachViewState();
}

class _CertificationAttachViewState extends State<CertificationAttachView> {
  late HomeEditAreaViewModel _controller;

  @override
  void initState() {
    _controller = locator.get<HomeEditAreaViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 18,
                        ),
                      ),
                    ),
                    Text(
                      'Certificação',
                      style: FontStyles.size16Weight700,
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                    'Envie um ou mais documentos que certifiquem o seu conhecimento para atuar na área selecionada.'),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () => _controller.addCertificationToList(
                      'Anexo${_controller.certificationList.length + 1}'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: ColorConstants.primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 24),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enviar certificação',
                          style: FontStyles.size16Weight700White,
                        ),
                        const Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Observer(
                  builder: (final _) => Column(
                    children: _controller.certificationList
                        .map(
                          (element) => ListTile(
                            title: Text(
                              element,
                              style: FontStyles.size16Weight700,
                            ),
                            trailing: IconButton(
                              onPressed: () => _controller
                                  .removeCertificationToList(element),
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
