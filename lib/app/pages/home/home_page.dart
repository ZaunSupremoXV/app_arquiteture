import 'package:app_arquiteture/app/app_controller.dart';
import 'package:app_arquiteture/app/app_theme.dart';
import 'package:app_arquiteture/app/models/apiadvisor_model.dart';
import 'package:app_arquiteture/app/pages/home/components/custom_circular_progress_indicator_widget.dart';
import 'package:app_arquiteture/app/pages/home/home_controller.dart';
import 'package:app_arquiteture/app/repositories/apiadvisor_repository.dart';
import 'package:app_arquiteture/app/services/client_http_service.dart';
import 'package:app_arquiteture/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(
        ClientHttpService(),
      ),
    ),
  );

  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });
    await controller.getTime();
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'E o tempo?',
              style: AppTheme.titleAppBar,
            ),
            toolbarHeight: 100,
            flexibleSpace: Image.asset(
              isDark ? "assets/images/night.jpg" : "assets/images/light.jpg",
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            actions: [
              CustomSwitchWidget(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.temperatureLow),
            onPressed: () {
              login();
            },
          ),
          body: ValueListenableBuilder<ApiadvisorModel?>(
              valueListenable: controller.time,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: isLoading
                            ? Center(
                                child: CustomCircularProgressIndicator(),
                              )
                            : Text(
                                'Clique no termometro para obter a notícia do tempo.',
                                style: AppTheme.textIntro,
                                textAlign: TextAlign.center,
                              ),
                      ),
                      // isLoading
                      //     ? Center(
                      //         child: CustomCircularProgressIndicator(),
                      //       )
                      //     : Container(),
                    ],
                  );
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                  child: Text(
                    model!.text,
                    style: AppTheme.textBody,
                    textAlign: TextAlign.justify,
                  ),
                );
              }),
        );
      },
    );
  }
}
