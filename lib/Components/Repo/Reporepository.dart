// ignore_for_file: non_constant_identifier_names

import 'package:edd/Components/model.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DONATIONRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("Donation");

  Future<void> create(
      {required String Title,
      required String Description,
      required int Phone,
      required int Bank_Account,
      required String Address}) async {
    try {
      await _fireCloud.add({
        "Title": Title,
        "Description": Description,
        "Phone": Phone,
        "Bank": Bank_Account,
        "Address": Address
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<DonationModel>> get async async {
    List<DonationModel> proList = [];

    try {
      final pro = await FirebaseFirestore.instance.collection('Donation').get();

      pro.docs.forEach((element) {
        return proList.add(DonationModel.fromjson(element.data()));
      });

      return proList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("failed");
      }
      return proList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
