import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/wallpaper.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Color(0xFF393939),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const MyText(
                      'Registrate',
                      color: Colors.pinkAccent,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF393939),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Da elejir entre tomar una foto o elegir una de la galeria
                            // Menu contextual
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 150,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const MyText(
                                        'Selecciona una opción',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const Gap(20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.all(15),
                                              child: const Column(
                                                children: [
                                                  Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                  ),
                                                  Gap(10),
                                                  MyText('Camara'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: const EdgeInsets.all(15),
                                              child: const Column(
                                                children: [
                                                  Icon(
                                                    Icons.photo,
                                                    color: Colors.white,
                                                  ),
                                                  Gap(10),
                                                  MyText('Galeria'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF303030),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Gap(10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const Gap(10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const Gap(10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                          obscureText: true,
                        ),
                        const Gap(10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Telefono',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          obscureText: true,
                        ),
                        const Gap(30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF303030),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              Gap(5),
                              MyText(
                                'Listo',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 102, 102, 102),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back),
                              Gap(5),
                              MyText(
                                'Volver',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
