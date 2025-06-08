import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CreateView'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama Sopir"),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan nama sopir',
              ),
            ),
            const SizedBox(height: 16),

            const Text("Muatan"),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan jumlah muatan',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            const Text("Tanggal"),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan tanggal (yyyy-mm-dd)',
              ),
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Data disimpan')));
        },
        icon: const Icon(Icons.save),
        label: const Text('Simpan'),
      ),
    );
  }
}
