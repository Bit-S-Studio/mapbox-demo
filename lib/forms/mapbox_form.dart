import 'package:reactive_forms/reactive_forms.dart';

import '../_exports.dart';

class MapBoxForm {
  final formGroup = FormGroup({
    ConstantsForms.startPoint:
        FormControl<String>(value: '', validators: [Validators.required]),
    ConstantsForms.startPointLat:
        FormControl<double>(value: null, validators: [Validators.required]),
    ConstantsForms.startPointLong: FormControl<double>(value: null),
    ConstantsForms.endPoint:
        FormControl<String>(value: '', validators: [Validators.required]),
    ConstantsForms.endPointLat:
        FormControl<double>(value: null, validators: [Validators.required]),
    ConstantsForms.endPointLong:
        FormControl<double>(value: null, validators: [Validators.required]),
    ConstantsForms.destinationLong: FormControl<double>(value: null),
    ConstantsForms.destinationLat: FormControl<double>(value: null),
  });

  String get startPoint => formGroup.control(ConstantsForms.startPoint).value;
  String get startPointLat =>
      formGroup.control(ConstantsForms.startPointLat).value;
  String get startPointLong =>
      formGroup.control(ConstantsForms.startPointLat).value;
  String get endPoint => formGroup.control(ConstantsForms.startPoint).value;
  String get endPointLat =>
      formGroup.control(ConstantsForms.startPointLat).value;
  String get endPointLong =>
      formGroup.control(ConstantsForms.startPointLat).value;
  double get destinationLong =>
      formGroup.control(ConstantsForms.destinationLong).value;
  double get destinationLat =>
      formGroup.control(ConstantsForms.destinationLat).value;

  set setStartPoint(String value) =>
      formGroup.control(ConstantsForms.startPoint).value = value;
  set setStartPointLat(double value) =>
      formGroup.control(ConstantsForms.startPointLat).value = value;
  set setStartPointLong(double value) =>
      formGroup.control(ConstantsForms.startPointLong).value = value;
  set setEndPoint(String value) =>
      formGroup.control(ConstantsForms.endPoint).value = value;
  set setEndPointLat(double value) =>
      formGroup.control(ConstantsForms.endPointLat).value = value;
  set setEndPointLong(double value) =>
      formGroup.control(ConstantsForms.endPointLong).value = value;
  set setDestinationLat(double value) =>
      formGroup.control(ConstantsForms.destinationLat).value = value;
  set setDestinationLong(double value) =>
      formGroup.control(ConstantsForms.destinationLong).value = value;

  void reset() {
    formGroup.control(ConstantsForms.startPoint).value = '';
    formGroup.control(ConstantsForms.startPointLat).value = null;
    formGroup.control(ConstantsForms.startPointLong).value = null;
    formGroup.control(ConstantsForms.endPoint).value = '';
    formGroup.control(ConstantsForms.endPointLat).value = null;
    formGroup.control(ConstantsForms.endPointLong).value = null;
    formGroup.control(ConstantsForms.destinationLong).value = null;
    formGroup.control(ConstantsForms.destinationLat).value = null;
  }

  void showErrors() {
    formGroup.control(ConstantsForms.startPoint).markAsDirty();
    formGroup.control(ConstantsForms.endPoint).markAsDirty();
    formGroup.control(ConstantsForms.destinationLong).markAsDirty();
    formGroup.control(ConstantsForms.destinationLat).markAsDirty();
  }
}
