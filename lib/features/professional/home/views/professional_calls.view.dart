import 'package:ehelp/features/professional/home/views/components/call_dialog.widget.dart';
import 'package:ehelp/features/professional/home/views/components/service_item_client.widget.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:ehelp/shared/components/person_picture.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/locator.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/default_dialog.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_professional.view_model.dart';
import 'components/service_item_call.widget.dart';

class ProfessionalCallsView extends StatefulWidget {
  const ProfessionalCallsView({Key? key}) : super(key: key);

  @override
  State<ProfessionalCallsView> createState() => _ProfessionalCallsViewState();
}

class _ProfessionalCallsViewState extends State<ProfessionalCallsView> {
  late HomeProfessionalViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<HomeProfessionalViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBlack(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const PersonPicture(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Olá, Morgan!',
                              style: FontStyles.size16Weight700White,
                            ),
                            Text(
                              'Profissional',
                              style: FontStyles.size14Weight400white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Observer(builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _viewModel.isAvaliableNow
                              ? ColorConstants.greenDark
                              : Colors.white),
                      child: IconButton(
                          icon: Icon(
                            _viewModel.isAvaliableNow
                                ? Icons.link_rounded
                                : Icons.link_off_rounded,
                            color: _viewModel.isAvaliableNow
                                ? Colors.white
                                : Colors.black,
                          ),
                          onPressed: () {
                            _viewModel
                                .setAvaliableNow(!_viewModel.isAvaliableNow);
                            Future.delayed(const Duration(seconds: 2))
                                .then((value) {
                              if (_viewModel.showCallNow) {
                                showDialog(
                                  context: context,
                                  builder: (builder) => const DefaultDialog(
                                    child: CallDialogWidget(),
                                  ),
                                );
                              }
                            });
                          }),
                    );
                  }),
                ],
              ),
            ),
          ),
          // Column(children: [
          //   Container(
          //     color: ColorConstants.blackSoft,
          //     width: double.infinity,
          //     child: SafeArea(
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 24,
          //         ),
          //         margin: const EdgeInsets.only(
          //           bottom: 24,
          //         ),
          //         height: MediaQuery.of(context).size.height / 12,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 const PersonPicture(),
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 16),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Text(
          //                         'Olá, Morgan!',
          //                         style: FontStyles.size16Weight700White,
          //                       ),
          //                       Text(
          //                         'Profissional',
          //                         style: FontStyles.size14Weight400white,
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Observer(builder: (_) {
          //               return Container(
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(15),
          //                     color: _viewModel.isAvaliableNow
          //                         ? ColorConstants.greenDark
          //                         : Colors.white),
          //                 child: IconButton(
          //                     icon: Icon(
          //                       _viewModel.isAvaliableNow
          //                           ? Icons.link_rounded
          //                           : Icons.link_off_rounded,
          //                       color: _viewModel.isAvaliableNow
          //                           ? Colors.white
          //                           : Colors.black,
          //                     ),
          //                     onPressed: () {
          //                       _viewModel.setAvaliableNow(
          //                           !_viewModel.isAvaliableNow);
          //                       Future.delayed(const Duration(seconds: 2))
          //                           .then((value) {
          //                         if (_viewModel.showCallNow) {
          //                           showDialog(
          //                             context: context,
          //                             builder: (builder) => const DefaultDialog(
          //                               child: CallDialogWidget(),
          //                             ),
          //                           );
          //                         }
          //                       });
          //                     }),
          //               );
          //             }),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          //   Container(
          //     color: ColorConstants.blackSoft,
          //     child: Container(
          //       width: double.infinity,
          //       height: 48,
          //       decoration: const BoxDecoration(
          //         color: ColorConstants.whiteBackground,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(30),
          //             topRight: Radius.circular(30)),
          //       ),
          //     ),
          //   ),
          // ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return _viewModel.showCallNow
                        ? Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Chamados Agora',
                                  style: FontStyles.size16Weight400,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ServiceItemCallWidget(),
                              const SizedBox(
                                height: 48,
                              ),
                            ],
                          )
                        : Container();
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Agendamentos',
                    style: FontStyles.size16Weight400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: ServiceItemClientWidget(
                      indexImage: index % 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
