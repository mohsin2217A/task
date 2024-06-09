
import 'package:eazio/app/modules/searching/widgets/bulding_marker_widget.dart';
import 'package:eazio/app/modules/searching/widgets/price_marker_widget.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../data/models/dummy_vets_model.dart';
import '../../../util/helper_class.dart';
import 'package:custom_info_window/custom_info_window.dart';

class SearchingController extends GetxController {
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  RxBool hasPermission = false.obs;
  RxBool showCard = false.obs;
  RxBool showLoader = true.obs;
  GoogleMapController? googleMapController;
  Rx<LatLng>? latLng = const LatLng(29.735455, -95.540241).obs;
  RxList<Marker> allMarkers = List<Marker>.empty().obs;
  Rx<String> mapStyle = "".obs;
  RxBool isMapVisible = true.obs;
  RxString selectedMarkerId = "0".obs;
  BitmapDescriptor? _normalIcon;
  RxList<DummyVetsModel> arrOfVets = List<DummyVetsModel>.empty().obs;
  RxBool showWindow = false.obs;
  RxString selectedOption = 'Price'.obs;

  RxList<Marker> markersList = List<Marker>.empty().obs;
  Set<Marker> markers = <Marker>{};

  @override
  void onInit() {
    super.onInit();

    createPriceMarkers();
  }

  createPriceMarkers() async {
    markersList.clear();
    markersList.add(Marker(
      markerId: const MarkerId("marker1"),
      position: const LatLng(29.735455, -95.540241),
      icon: await const PriceMarkerWidget(price: '13,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker2"),
      position: const LatLng(29.733638, -95.545948),
      icon: await const PriceMarkerWidget(price: '15,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker3"),
      position: const LatLng(29.731044, -95.547351),
      icon: await const PriceMarkerWidget(price: '20,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker4"),
      position: const LatLng(29.736526, -95.538664),
      icon: await const PriceMarkerWidget(price: '23,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker5"),
      position: const LatLng(29.732453, -95.534497),
      icon: await const PriceMarkerWidget(price: '33,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker6"),
      position: const LatLng(29.728302, -95.536316),
      icon: await const PriceMarkerWidget(price: '43,3 mn',).toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {},
      // To do: custom marker icon
    ));
  }

  Future<void> createBuildingMarkers() async {
    markersList.clear();
    markersList.add(Marker(
      markerId: const MarkerId("marker1"),
      position: const LatLng(29.735455, -95.540241),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker2"),
      position: const LatLng(29.733638, -95.545948),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker3"),
      position: const LatLng(29.731044, -95.547351),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker4"),
      position: const LatLng(29.736526, -95.538664),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker5"),
      position: const LatLng(29.732453, -95.534497),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));

    markersList.add(Marker(
      markerId: const MarkerId("marker6"),
      position: const LatLng(29.728302, -95.536316),
      icon: await const BuildingMarkerWidget().toBitmapDescriptor(),
      draggable: true,
      onDragEnd: (value) {
        // value is the new position
      },
      // To do: custom marker icon
    ));
  }

  void onMapCreated(controller) {
    googleMapController = controller;
    controller.setMapStyle(Helper.mapDarkThemeStyling());
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 15, bearing: 40, target: latLng!.value)));
  }

  void _onMarkerTapped(String markerId) {
    selectedMarkerId.value = markerId;
  }

  Set<Marker> getMarkers(bool isSelect) {
    return allMarkers.toSet();

    // return allMarkers.map((marker) {
    //   if (marker.markerId.value == selectedMarkerId.value && isSelect) {
    //     return marker.copyWith(iconParam: _selectedIcon);
    //   } else {
    //     return marker.copyWith(iconParam: _normalIcon);
    //   }
    // }).toSet();
  }
}
