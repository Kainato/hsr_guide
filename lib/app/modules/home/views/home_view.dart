import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsr_guide/app/modules/home/controllers/home_controller.dart';
import 'package:hsr_guide/class/personagem.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personagens'), centerTitle: true),
      body: FutureBuilder(
        future: controller.fetchGoogleSheetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: SelectableText('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final Personagem item = controller.data[index];
                return Card(
                  child: ListTile(
                    title: Text(item.nome),
                    subtitle: Text('Raridade: ${item.raridade}'),
                    trailing: Text('Caminho: ${item.caminho}'),
                    leading: Image.network(item.foto),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
