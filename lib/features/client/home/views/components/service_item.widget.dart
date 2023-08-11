import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/random_person_image.widget.dart';
import 'package:ehelp/shared/components/start_score.widget.dart';
import 'package:ehelp/shared/entity/service_status.entity.dart';
import 'package:ehelp/shared/utils/money.formatter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/custom_date.dart';
import '../../model/entity/service_for_client.entity.dart';

// ignore: must_be_immutable
class ServiceItemWidget extends StatefulWidget {
  ServiceItemWidget({
    required this.indexImage,
    required this.cardData,
    this.expansive = false,
    Key? key,
  }) : super(key: key);

  bool expansive;
  final int indexImage;
  final ServiceForClientEntity cardData;

  @override
  State<ServiceItemWidget> createState() => _ServiceItemWidgetState();
}

class _ServiceItemWidgetState extends State<ServiceItemWidget>
    with SingleTickerProviderStateMixin {
  final ExpandableController expandController = ExpandableController();

  late final AnimationController _controllerAnimation;
  late ServiceForClientEntity _cardData;

  @override
  void initState() {
    super.initState();
    _cardData = widget.cardData;
    _controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  Widget _buildBodyCollapsed(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 16, top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RandomPersonImage(
            path: _cardData.photoUrl,
            indexImage: widget.indexImage,
            widthtImage: MediaQuery.of(context).size.width / 5,
          ),
          Flexible(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      _cardData.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: Text(
                      _cardData.descriptionPortuguese,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StarScore(value: _cardData.rating),
                        Text(
                          Money.format(_cardData.minValue),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.greenDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          if (widget.expansive)
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controllerAnimation),
              child: const Icon(Icons.keyboard_arrow_down_rounded),
            )
        ],
      ),
    );
  }

  Widget _buildBodyExpanded(BuildContext context) {
    return Column(
      children: [
        _buildBodyCollapsed(context),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              if (_cardData.serviceStatus != null)
                Flexible(
                  flex: 2,
                  child: Text(
                    _cardData.serviceStatus!.convertToString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Agendado para',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  CustomDate.format(_cardData.serviceDate),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Chegará às',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '09 : 30',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget _buildExpandablePannel(BuildContext context) {
    return ExpandablePanel(
      controller: expandController,
      theme: const ExpandableThemeData(
        iconColor: Colors.black,
        iconSize: 88,
        useInkWell: true,
        tapHeaderToExpand: true,
        hasIcon: true,
      ),
      collapsed: _buildBodyCollapsed(context),
      expanded: _buildBodyExpanded(context),
    );
  }

  void onToggleClick() {
    expandController.toggle.call();
    setState(() {
      if (expandController.expanded) {
        _controllerAnimation.forward(from: 0);
      } else {
        _controllerAnimation.reverse(from: 0.5);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: ColorConstants.primaryV2,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: widget.expansive
            ? onToggleClick
            : () => Navigator.of(context).pushNamed(
                EhelpRoutes.clientUserProfessionalProfile,
                arguments: _cardData),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: -5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: widget.expansive
                      ? _buildExpandablePannel(context)
                      : _buildBodyCollapsed(context),
                )),
          ],
        ),
      ),
    );
  }
}
