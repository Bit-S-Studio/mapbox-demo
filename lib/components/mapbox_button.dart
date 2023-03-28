import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../_exports.dart';

class MapBoxButton extends StatelessWidget {
  final MapBoxController controller;
  const MapBoxButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: controller.form.formGroup,
      child: ReactiveFormConsumer(builder: (context, form, value) {
        final destinationLat =
            form.control(ConstantsForms.destinationLat).value;
        final destinationLong =
            form.control(ConstantsForms.destinationLong).value;
        final startPointLat = form.control(ConstantsForms.startPointLat).value;
        final startPointLon = form.control(ConstantsForms.startPointLong).value;
        final endPointLat = form.control(ConstantsForms.endPointLat).value;
        final endPointLong = form.control(ConstantsForms.endPointLong).value;
        return ElevatedButton(
          onPressed: () {
            if (form.valid) {
              Map data = {
                "changePointLat": destinationLat,
                "changePointLng": destinationLong,
                "startPointLat": startPointLat,
                "startPointLon": startPointLon,
                "endPointLat": endPointLat,
                "endPointLong": endPointLong,
              };
              controller.postDataToNative(data);
            } else {
              controller.form.showErrors();
            }
          },
          child: const Text('Start Navigator'),
        );
      }),
    );
  }
}
