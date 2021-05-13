import 'package:dashboard/components/app_drawer.dart';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProgramsScreen extends StatefulWidget {
  @override
  _ProgramsScreenState createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Programas"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SfDataGrid(
            source: null,
            columns: <GridColumn>[
              GridNumericColumn(mappingName: 'id', headerText: 'ID'),
              GridTextColumn(mappingName: 'name', headerText: 'Name'),
              GridTextColumn(
                  mappingName: 'controller', headerText: 'Controller'),
            ],
          );
        },
      ),
    );
  }
}
