import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: () {},
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
      ),
      body: Center(
        child: Text('Home Page')
      ),
      bottomNavigationBar: CustomNAvigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}