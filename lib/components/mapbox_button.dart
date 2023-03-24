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
        final endPointLat = form.control(ConstantsForms.destinationLat).value;
        final endPointLong = form.control(ConstantsForms.destinationLat).value;
        return ElevatedButton(
          onPressed: () {
            if (form.valid) {
              Map data = {
                "changePointLat": destinationLat,
                "changePointLng": destinationLong,
                "startPointLat": startPointLat.toString(),
                "startPointLon": startPointLon.toString(),
                "endPointLat": endPointLat.toString(),
                "endPointLong": endPointLong.toString(),
              };
              controller.postDataToNative(data);
            }
          },
          child: const Text('Start Navigator'),
        );
      }),
    );
  }
}
