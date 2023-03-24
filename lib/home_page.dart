import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MapBoxForm form;
  late MapBoxController controller;

  @override
  void initState() {
    AskPermissionsAction.call();
    form = MapBoxForm();
    controller = MapBoxController(form: form);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: controller.form.formGroup,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                MapBoxForms(controller: controller),
                const SizedBox(height: 19),
                ValueListenableBuilder<String>(
                    valueListenable: controller.reportStatus,
                    builder: (context, value, child) {
                      return Text(value);
                    }),
                const SizedBox(height: 15),
                ValueListenableBuilder<String>(
                    valueListenable: controller.initialRoute,
                    builder: (context, value, child) {
                      return Text(value);
                    }),
                const SizedBox(height: 15),
                CustomLoading(controller: controller),
                const SizedBox(height: 15),
                LocationList(controller: controller)
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MapBoxButton(controller: controller),
          ),
        ),
      ),
    );
  }
  // String proximity = '${sharedPreferences.getDouble('longitude')}%2C${sharedPreferences.getDouble('latitude')}';
}
