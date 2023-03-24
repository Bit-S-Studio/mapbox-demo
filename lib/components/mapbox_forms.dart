import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../_exports.dart';

class MapBoxForms extends StatelessWidget {
  final MapBoxController controller;
  const MapBoxForms({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveTextField<String>(
          formControlName: ConstantsForms.startPoint,
          decoration: const InputDecoration(
              hintText: 'start point', labelText: "Start point"),
          onChanged: (text) {
            controller.isResponseForDestination.value = true;
            if ((text.value ?? '').length > 2) {
              controller.onChangeHandler(text.value ?? '');
            }
          },
        ),
        const SizedBox(height: 15),
        ReactiveTextField<String>(
          formControlName: ConstantsForms.endPoint,
          decoration: const InputDecoration(
              hintText: 'end point', labelText: "End point"),
          onChanged: (text) {
            controller.isResponseForDestination.value = false;
            if ((text.value ?? '').length > 2) {
              controller.onChangeHandler(text.value ?? '');
            }
          },
        ),
        const SizedBox(height: 19),
        ReactiveTextField<double>(
          formControlName: ConstantsForms.destinationLong,
          keyboardType: const TextInputType.numberWithOptions(
              signed: false, decimal: true),
          decoration: const InputDecoration(
            hintText: 'Change Destination Latitude',
            labelText: "Destination Latitude",
          ),
        ),
        const SizedBox(height: 10),
        ReactiveTextField<double>(
          formControlName: ConstantsForms.destinationLat,
          keyboardType: const TextInputType.numberWithOptions(
              signed: false, decimal: true),
          decoration: const InputDecoration(
            hintText: 'Change Destination Latitude',
            labelText: "Destination Latitude",
          ),
        )
      ],
    );
  }
}
