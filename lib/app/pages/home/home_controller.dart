import 'package:app_arquiteture/app/models/apiadvisor_model.dart';
import 'package:app_arquiteture/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel?> get time => viewModel.apiadvisorModel;

  getTime() {
    viewModel.fill();
  }
}
