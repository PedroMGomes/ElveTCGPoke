import 'package:elve_tcg_poke/components/common/pokeball_widget.dart';
import 'package:flutter/material.dart';

enum DrawerIndex {
  home,
  sets,
  types,
}

class ElveDrawer extends StatelessWidget {
  ElveDrawer({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  /// Current index.
  final DrawerIndex currentIndex;
  final Function(DrawerIndex) onTap;

  static const List<_DrawerItem> itemList = [
    _DrawerItem(name: 'Home', iconData: Icons.home, index: DrawerIndex.home),
    _DrawerItem(name: 'Sets', iconData: Icons.list, index: DrawerIndex.sets),
    _DrawerItem(
        name: 'Types', iconData: Icons.category, index: DrawerIndex.types),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: [
                  PokeballWidget(
                    width: 32.0,
                    height: 32.0,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: FittedBox(
                      child: Container(
                        child: Text('Elve TCG Poke',
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.6),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0.0),
                children: itemList
                    .map((item) => InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () => onTap(item.index),
                          child: _DrawerItemWiget(
                            item: item,
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerItemWiget extends StatelessWidget {
  const _DrawerItemWiget({Key? key, required this.item, this.isCurrent = false})
      : super(key: key);

  final _DrawerItem item;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          Icon(item.iconData),
          const SizedBox(width: 16.0),
          Text(
            item.name,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  letterSpacing: 0.8,
                ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final String name;
  final IconData iconData;
  final DrawerIndex index;

  const _DrawerItem(
      {required this.name, required this.iconData, required this.index});
}
