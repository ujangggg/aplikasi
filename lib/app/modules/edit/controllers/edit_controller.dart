import 'package:aplikasi/app/data/muatan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late TextEditingController sopirC;
  late TextEditingController muatanC;
  late TextEditingController tanggalC;

  var namaSopir = Rxn<String>();
  var muatan = Rxn<int>();
  var tanggal = Rxn<DateTime>();

  late final MuatanModel args;

  @override
  void onInit() {
    super.onInit();
    sopirC = TextEditingController();
    muatanC = TextEditingController();
    tanggalC = TextEditingController();
    args = Get.arguments as MuatanModel;
  }

  @override
  void onClose() {
    sopirC.dispose();
    muatanC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  Future<void> updateMuatan(MuatanModel muatanBaru) async {
    try {
      await _firestore.collection('muatan').doc(muatanBaru.id).update({
        'namaSopir': muatanBaru.namaSopir,
        'jumlahMuatan': muatanBaru.jumlahMuatan,
        'tanggal': Timestamp.fromDate(muatanBaru.tanggal), // ✅ format aman Firestore
      });

      Get.snackbar(
        'Sukses',
        'Data berhasil diperbarui',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      await Future.delayed(const Duration(milliseconds: 600)); // beri waktu snackbar tampil
      Get.offAllNamed('/home'); // ✅ kembali ke Home
    } catch (e) {
      Get.snackbar('Error', 'Gagal memperbarui data: $e');
    }
  }
}
