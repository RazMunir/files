import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/datatable_sortable/page/sortable_page.dart';
import 'package:flutter_profile_app/example/datatable_sortable/widget/tabbar_widget.dart';

class DataTable_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      title: "DataTable Sample",
      tabs: [
        Tab(icon: Icon(Icons.sort_by_alpha), text: 'Sortable'),
        Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
        Tab(icon: Icon(Icons.edit), text: 'Editable'),
      ],
      children: [
        SortablePage(),
        Container(),
        Container(),
      ],
    );
  }
}
