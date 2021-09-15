import 'package:app_arquiteture/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiadvisorModel> getTime();
}
