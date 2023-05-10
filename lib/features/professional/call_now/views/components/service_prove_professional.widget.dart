import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/locator.dart';
import '../../../../../routes/ehelp_routes.dart';
import '../../../../../shared/colors/constants.dart';
import '../../../../../shared/components/generic_button.widget.dart';
import '../../../../../shared/components/input.widget.dart';
import '../../../../../shared/fonts/styles.dart';
import '../../../../../shared/utils/picker.dart';
import '../../view_model/call_now_professional.view_model.dart';

class ServiceProveProfessionalWidget extends StatelessWidget {
  ServiceProveProfessionalWidget({Key? key}) : super(key: key);

  final CallNowProfessionalViewModel _controller =
      locator.get<CallNowProfessionalViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.file(
                                  File(e!.path),
                                  height: 150,
                                ),
                                IconButton(
                                  onPressed: () =>
                                      _controller.removeImageToList(e),
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
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
    );
  }
}
