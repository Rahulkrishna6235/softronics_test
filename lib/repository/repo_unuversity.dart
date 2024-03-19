

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:softronics_test/Modal/universitymodal.dart';

class UniversityRepo{

  Future<List<UniversityModal>?> GetProducts() async{
    var dio = Dio();
    var response = await dio.request(
      'http://universities.hipolabs.com/search?name=middle',
      options: Options(
      method: 'GET',
    ),
    );

    if (response.statusCode == 200) {
    print((response.data));
    List<dynamic> responseData =response.data;
    List<UniversityModal>assignedWorkList = responseData.map((json) => UniversityModal.fromJson(json)).toList();
    return assignedWorkList;
    }
    else {
    print(response.statusMessage);
    }
  }
}