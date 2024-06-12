import 'package:flutter/material.dart';

import 'routes_list_widget.dart';

class ScrollPanelWithList extends StatelessWidget {
  final ScrollController sc;
  const ScrollPanelWithList({required this.sc, super.key});

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('search'),
          // child: FiltersPlace(),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('filters'),
          // child: FiltersPlace(),
        ),
        RoutesListWidget(),
      ],
    );
  }
}
