import 'package:app_arquiteture/app/interfaces/client_http_interface.dart';
import 'package:app_arquiteture/app/models/apiadvisor_model.dart';

import 'apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiadvisorModel> getTime() async {
    var json = await client.get(
        'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=e80756c895434c7c1b25a73cfc424bf9');
    print(json);

    ApiadvisorModel model = ApiadvisorModel.fromMap(json[0]);
    return model;
  }
}
