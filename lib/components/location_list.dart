import '../_exports.dart';
import 'package:flutter/material.dart';

class LocationList extends StatelessWidget {
  final MapBoxController controller;
  const LocationList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<LocationModel>(
        valueListenable: controller.locationList,
        builder: (context, locationList, child) {
          return ValueListenableBuilder<bool>(
              valueListenable: controller.isResponseForDestination,
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: locationList.features?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            String text =
                                locationList.features?[index].placeName ?? "";
                            if (value) {
                              controller.form.setStartPoint = text;
                              controller.form.setStartPointLat = locationList
                                      .features?[index]
                                      .geometry
                                      ?.coordinates
                                      ?.last ??
                                  0.0;
                              controller.form.setStartPointLong = locationList
                                      .features?[index]
                                      .geometry
                                      ?.coordinates
                                      ?.first ??
                                  0.0;
                            } else {
                              controller.form.setEndPoint = text;
                              controller.form.setEndPointLat = locationList
                                      .features?[index]
                                      .geometry
                                      ?.coordinates
                                      ?.last ??
                                  0.0;
                              controller.form.setEndPointLong = locationList
                                      .features?[index]
                                      .geometry
                                      ?.coordinates
                                      ?.first ??
                                  0.0;
                            }
                            locationList.features = [];
                            FocusManager.instance.primaryFocus?.nextFocus();
                          },
                          leading: const SizedBox(
                            height: double.infinity,
                            child: CircleAvatar(child: Icon(Icons.map)),
                          ),
                          title: Text(locationList.features?[index].text ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              (locationList.features?[index].placeName ?? ""),
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
              });
        });
  }
}
