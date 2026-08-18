import 'package:cantos_flutter/providers/new_scheem_provider.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class NewScheemView extends StatelessWidget {
  final bool newScheem;

  const NewScheemView({super.key, required this.newScheem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(newScheem ? 'Nuevo esquema' : 'Modificar esquema'),
        actions: [
          Builder(
            builder: (context) {
              if (newScheem) return const SizedBox();
              return IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(
                      'Nombre',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const Gap(5),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Nombre del esquema',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Gap(15),
                    ElevatedButton(
                      onPressed: () {
                        context.read<NewScheemProvider>().addSong();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Constants.colorPrimaryLight,
                      ),
                      child: const MyText(
                        'Agregar canto',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(15),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: MyText(
                              'Canto ${index + 1}',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Constants.colorPrimaryLight,
                ),
                child: MyText(
                  newScheem ? 'Guardar esquema' : 'Modificar esquema',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
