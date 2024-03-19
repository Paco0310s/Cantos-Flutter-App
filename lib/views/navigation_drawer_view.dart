import 'package:cantos_flutter/models/navigation_view_model.dart';
import 'package:cantos_flutter/providers/navigation_drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerView extends StatelessWidget {
  const NavigationDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationDrawerProvider navigationDrawerProvider = Provider.of<NavigationDrawerProvider>(context);
    final NavigationViewsModel selectedNavigationModel = navigationDrawerProvider.selectedNavigationModel;

    return Scaffold(
      appBar: selectedNavigationModel.appBar,
      floatingActionButton: selectedNavigationModel.floatingActionButton,
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         decoration: const BoxDecoration(color: Constants.colorPrimary),
      //         accountName: const MyText('Nombre'),
      //         accountEmail: const MyText('Correo'),
      //         currentAccountPicture: Container(
      //           padding: const EdgeInsets.all(5),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(50),
      //             color: Constants.colorPrimaryDark,
      //           ),
      //           child: const Icon(
      //             Icons.person,
      //             size: 55,
      //             color: Constants.colorTextPrimary,
      //           ),
      //         ),
      //       ),
      //       ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: navigationDrawerProvider.listViews.length,
      //         physics: const BouncingScrollPhysics(),
      //         itemBuilder: (BuildContext context, int index) {
      //           return ListTile(
      //             leading: navigationDrawerProvider.listViews[index].icon,
      //             title: navigationDrawerProvider.listViews[index].appBar.title,
      //             onTap: () {
      //               navigationDrawerProvider.changeViewByIndex(index);
      //             },
      //           );
      //         },
      //       )
      //     ],
      //   ),
      // ),
      body: selectedNavigationModel.view,
    );
  }
}
