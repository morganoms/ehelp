import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceItemWidget extends StatefulWidget {
  ServiceItemWidget({
    this.expansive = false,
    Key? key,
  }) : super(key: key);

  bool expansive;

  @override
  State<ServiceItemWidget> createState() => _ServiceItemWidgetState();
}

class _ServiceItemWidgetState extends State<ServiceItemWidget>
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
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Morgan Oliveira',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    'Eletricista',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        r'R$ 50,00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        '0.0',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.star_purple500_outlined,
                        color: Colors.yellow.shade700,
                      )
                    ],
                  ),
                ),
              ]),
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
                  color: const Color(0xFFE0E0E0),
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
            color: const Color(0xFF575757),
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
    );
  }
}
