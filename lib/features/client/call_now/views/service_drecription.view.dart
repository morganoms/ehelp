import 'dart:io';

import 'package:ehelp/locator.dart';
import 'package:ehelp/shared/components/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/Colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../../../../shared/utils/picker.dart';
import '../view_model/service_description.view_Model.dart';

class ServiceDescriptionView extends StatefulWidget {
  const ServiceDescriptionView({Key? key}) : super(key: key);

  @override
  State<ServiceDescriptionView> createState() => _ServiceDescriptionViewState();
}

class _ServiceDescriptionViewState extends State<ServiceDescriptionView> {
  late ServiceDescriptionViewModel _controller;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    _controller = locator.get<ServiceDescriptionViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Chamar',
          color: ColorConstants.greenDark,
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientCallNowPayment),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBlack(
              titleLable: 'Chamar Agora',
              iconBack: BackButtonWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Envie no máximo 3 imagens que detalhem o motivo deste chamado e depois deixe uma breve descrição do mesmo',
                    style: FontStyles.size16Weight400,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final List<XFile?> images = await Picker.multipleImages();
                      if (images.isNotEmpty) {
                        _controller.addImageAllToList(images);
                      }
                    },
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
                            'Enviar foto',
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
                    height: 24,
                  ),
                  Observer(
                    builder: (_) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: _controller.selectedImages.isNotEmpty
                              ? _controller.selectedImages
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Image.file(
                                            File(e!.path),
                                            height: 150,
                                          ),
                                          IconButton(
                                            onPressed: () => _controller
                                                .removeImageToList(e),
                                            icon: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  100,
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.close_rounded,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Input(
                      label: const Text('Descrição do Serviço'),
                      maxLines: 5,
                      borderRadius: BorderRadius.circular(20))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
