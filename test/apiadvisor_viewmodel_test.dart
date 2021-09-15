import 'package:app_arquiteture/app/repositories/apiadvisor_repository.dart';
import 'package:app_arquiteture/app/services/client_http_service.dart';
import 'package:app_arquiteture/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('ApiAdvisorViewModel error', () async {
    final viewModel =
        ApiadvisorViewModel(ApiadvisorRepository(ClientHttpService()));

    await viewModel.fill();
    expect(viewModel.apiadvisorModel.value, null);
  });
}
