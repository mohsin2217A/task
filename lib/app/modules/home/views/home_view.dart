import 'package:eazio/app/components/resources/app_decorations.dart';
import 'package:eazio/app/components/resources/string_constants.dart';
import 'package:eazio/app/modules/home/widgets/buy_widget.dart';
import 'package:eazio/app/modules/home/widgets/place_item.dart';
import 'package:eazio/app/modules/home/widgets/rent_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../components/resources/app_colors.dart';
import '../../../components/resources/custom_text_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/app_bar_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final Duration fadeDuration = 800.ms;
    final Duration scaleDuration = 300.ms;

    return Scaffold(
      backgroundColor: AppColors.bgEndColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                expandedHeight: 390,
                floating: true,
                scrolledUnderElevation: 0.0,
                pinned: true,
                title: AppBarView(
                  fadeDuration: fadeDuration,
                  scaleDuration: scaleDuration,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Opacity(
                    opacity: 1,
                    child: SafeArea(
                      child: Container(
                        decoration: AppDecorations.gradientBox(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 70,
                              ),
                              const CustomTextWidget(
                                text: 'Hi, Marina',
                                color: AppColors.headingColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              )
                                  .animate()
                                  .fade(duration: fadeDuration)
                                  .scale(delay: scaleDuration),
                              const SizedBox(
                                height: 5,
                              ),
                              const CustomTextWidget(
                                text: StringConstants.letsSelectText,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              )
                                  .animate()
                                  .fade(duration: fadeDuration)
                                  .scale(delay: scaleDuration),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: BuyWidget(
                                    count: 1034,
                                    fadeDuration: fadeDuration,
                                    scaleDuration: scaleDuration,
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: RentWidget(
                                    count: 2212,
                                    fadeDuration: fadeDuration,
                                    scaleDuration: scaleDuration,
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ];
        },
        body: Container(
          width: double.infinity,
          decoration: AppDecorations.roundedDecoration(
              bgColor: AppColors.white,
              borderColor: AppColors.white,
              borderRadius: 20),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: GridView.custom(
            padding: const EdgeInsets.only(top: 10),
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              repeatPattern: QuiltedGridRepeatPattern.same,
              pattern: [
                const QuiltedGridTile(2, 4),
                const QuiltedGridTile(4, 2),
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(2, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                childCount: controller.list.length, (context, index) {
              return PlaceItem(model: controller.list[index]);
            }),
          ),
        ),
      ),
    );
  }
}
