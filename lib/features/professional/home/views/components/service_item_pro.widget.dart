import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/Colors/constants.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceItemProWidget extends StatefulWidget {
  ServiceItemProWidget({
    this.expansive = false,
    Key? key,
  }) : super(key: key);

  bool expansive;

  @override
  State<ServiceItemProWidget> createState() => _ServiceItemProWidgetState();
}

class _ServiceItemProWidgetState extends State<ServiceItemProWidget>
    with SingleTickerProviderStateMixin {
  final ExpandableController expandController = ExpandableController();

  late final AnimationController _controllerAnimation;

  @override
  void initState() {
    super.initState();

    _controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  Widget _buildBodyCollapsed(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 56, top: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    child: Text(
                      'Maria Almeida',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Flexible(
                    child: Text(
                      'Problema de fio desencapado devido a acidente',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Text('Pendente', style: FontStyles.size14Weight500),
                  ),
                ]),
          ),
          const Icon(Icons.keyboard_arrow_right_rounded),
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
              Flexible(
                child: Text(
                  'Confirmado',
                  style: TextStyle(
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
                  'Data de Solicitação',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '25/10/2022',
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
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Flexible(
                flex: 8,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConstants.primaryV2Dark,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onTap: widget.expansive
                        ? onToggleClick
                        : () => Navigator.of(context)
                            .pushNamed(EhelpRoutes.clientUserProfile),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: widget.expansive
                          ? _buildExpandablePannel(context)
                          : _buildBodyCollapsed(context),
                    ),
                  ),
                )),
          ],
        ),
        Container(
          height: 75,
          margin: const EdgeInsets.only(top: 24),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/person1.jpg',
              ),
            ),
            color: const Color(0xFF575757),
          ),
        ),
      ],
    );
  }
}
