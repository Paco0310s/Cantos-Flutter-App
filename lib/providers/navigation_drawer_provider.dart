import 'package:cantos_flutter/functions/data_search.dart';
import 'package:cantos_flutter/models/navigation_view_model.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/views/login_view.dart';
import 'package:cantos_flutter/views/new_scheem_view.dart';
import 'package:cantos_flutter/views/new_song_view.dart';
import 'package:cantos_flutter/views/scheems_view.dart';
import 'package:cantos_flutter/views/songs_view.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerProvider extends ChangeNotifier {
  late final List<NavigationViewsModel> _listViews;
  List<NavigationViewsModel> get listViews => _listViews;

  late NavigationViewsModel _selectedNavigationModel;
  NavigationViewsModel get selectedNavigationModel => _selectedNavigationModel;

  NavigationDrawerProvider() {
    _listViews = [
      NavigationViewsModel(
        icon: const Icon(Icons.home),
        appBar: AppBar(
          title: const MyText('Cantos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                search(Get.context!);
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Nuevo') {
                  Get.to(
                    () => const NewSongView(),
                    transition: Transition.rightToLeft,
                  );
                } else if (value == 'Acerca de') {
                  showAdaptiveDialog(
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const MyText('Acerca de'),
                        content: const MyText('© Paco Sotelo 2024 para el mundo\n\nVersión 0.1.0'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const MyText('Aceptar', fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  );
                } else if ('Cerrar Sesión' == value) {
                  showAdaptiveDialog(
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const MyText('Cerrar sesión'),
                        content: const MyText('¿Estás seguro de cerrar sesión?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const MyText('Cancelar', fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              Get.to(
                                () => const LoginView(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: const MyText('Aceptar', fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return ['Nuevo', 'Acerca de'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: MyText(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        view: const SongsView(),
      ),
      NavigationViewsModel(
        icon: const Icon(Icons.music_note),
        appBar: AppBar(
          title: const MyText('Mis Cantos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                search(Get.context!);
              },
            ),
          ],
        ),
        view: const SongsView(),
      ),
      NavigationViewsModel(
        icon: const Icon(Icons.queue_music_rounded),
        appBar: AppBar(
          title: const MyText('Esquemas'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                search(Get.context!);
              },
            ),
          ],
        ),
        // Animación al aparecer
        floatingActionButton: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(seconds: 5),
          child: FloatingActionButton(
            backgroundColor: Constants.colorPrimaryLight,
            onPressed: () {
              Get.to(
                () => const NewScheemView(newScheem: true),
                transition: Transition.rightToLeft,
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        view: const ScheemsView(),
      ),
      // NavigationViewsModel(
      //   icon: const Icon(Icons.logout),
      //   appBar: AppBar(
      //     title: const MyText('Cerrar sesión'),
      //   ),
      // ),
    ];

    _selectedNavigationModel = _listViews.first;
  }

  search(BuildContext context) {
    showSearch(context: context, delegate: DataSearch());
  }

  changeViewByIndex(int index) {
    _selectedNavigationModel = _listViews[index];
    notifyListeners();
    Get.back();
  }
}
