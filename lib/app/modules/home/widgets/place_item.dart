import 'package:eazio/app/data/models/dummy_model.dart';
import 'package:flutter/material.dart';
import '../../../components/widgets/common_image_view.dart';
import '../../../components/widgets/custom_switch_button.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.model});

  final DummyModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonImageView(
          width: double.maxFinite,
          height: 400,
          fit: BoxFit.cover,
          url: model.image,
          radius: const BorderRadius.all(Radius.circular(15)),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: CustomSwitchButton(
            height: 40,
            name: model.name,
          ),
        )
      ],
    );
  }
}
