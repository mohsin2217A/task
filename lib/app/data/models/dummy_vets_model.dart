import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DummyVetsModel {
  String? image;
  String? name;
  String? skill;
  String? location;
  LatLng? latLng;
  bool? isOpen;
  String? timings;
  RxBool? isSelected;

  DummyVetsModel({
    this.image,
    this.name,
    this.skill,
    this.location,
    this.latLng,
    this.isOpen,
    this.timings,
    this.isSelected,
  });
}
