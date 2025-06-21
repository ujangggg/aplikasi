import 'package:aplikasi/app/data/muatan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Muatan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Nama Sopir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: controller.args.namaSopir,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan nama sopir',
                    ),
                    onChanged: (value) {
                      controller.namaSopir.value = value;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "Muatan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: controller.args.jumlahMuatan.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan jumlah muatan',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.muatan.value = int.tryParse(value);
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "Tanggal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: DateFormat(
                      'yyyy-MM-dd',
                    ).format(controller.args.tanggal),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan tanggal (yyyy-mm-dd)',
                    ),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      try {
                        final parsed = DateTime.parse(value);
                        controller.tanggal.value = parsed;
                      } catch (_) {
                        Get.snackbar(
                          'Error',
                          'Format tanggal salah (yyyy-mm-dd)',
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton.icon(
                    onPressed: () {
                      final muatanBaru = MuatanModel(
                        id: controller.args.id!,
                        namaSopir:
                            controller.namaSopir.value ??
                            controller.args.namaSopir,
                        jumlahMuatan:
                            controller.muatan.value ??
                            controller.args.jumlahMuatan,
                        tanggal:
                            controller.tanggal.value ?? controller.args.tanggal,
                      );

                      controller.updateMuatan(muatanBaru);
                    },
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: const Text(
                      'Simpan Perubahan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
