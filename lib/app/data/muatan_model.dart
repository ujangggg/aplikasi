import 'package:cloud_firestore/cloud_firestore.dart';

class MuatanModel {
  String? id;
  String namaSopir;
  int jumlahMuatan;
  DateTime tanggal;

  MuatanModel({
    this.id,
    required this.namaSopir,
    required this.jumlahMuatan,
    required this.tanggal,
  });

  // Convert Firestore data to model
  factory MuatanModel.fromMap(Map<String, dynamic> map, String id) {
    return MuatanModel(
      id: id,
      namaSopir: map['namaSopir'],
      jumlahMuatan: map['jumlahMuatan'],
      tanggal: (map['tanggal'] as Timestamp).toDate(),
    );
  }

  // Convert model to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'namaSopir': namaSopir,
      'jumlahMuatan': jumlahMuatan,
      'tanggal': tanggal,
    };
  }
}
