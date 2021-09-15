import 'package:app_arquiteture/app/models/apiadvisor_model.dart';
import 'package:app_arquiteture/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/cupertino.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;

  final apiadvisorModel = ValueNotifier<ApiadvisorModel?>(null);

  ApiadvisorViewModel(this.repository);

  fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch (e) {
      print(e);
    }
  }
}
