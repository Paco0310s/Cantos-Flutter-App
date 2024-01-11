import 'package:cantos_flutter/providers/scheems_provider.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheemsView extends StatelessWidget {
  const ScheemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.read<ScheemsProvider>().goToNewScheem(index);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 5),
                decoration: BoxDecoration(
                  color: Constants.colorPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Nombre',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<ScheemsProvider>().goToNewScheem(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Canto ${index + 1}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                    const Divider()
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
