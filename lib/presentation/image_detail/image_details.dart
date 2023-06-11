import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/color_manager/color_manager.dart';
import '../../models/image_model.dart';

class ImageDetailScreen extends StatelessWidget {
  static String get routeName => 'image_detail_screen';
  static String get routeLocation => routeName;
  const ImageDetailScreen({
    super.key,
    required this.imageModel,
  });

  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Details'),
        titleTextStyle: const TextStyle(
          color: AppColors.light,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 80),
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.luminosity,
                color: Colors.greenAccent,
              ),
              height: mediaQuery.height * 0.68,
              child: Hero(
                tag: imageModel.id,
                child: Image.network(
                  imageModel.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                  color: Colors.white),
              height: mediaQuery.height * 0.4,
              child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      imageModel.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.textBlack),
                    ),
                    const Gap(10),
                    Text(
                      imageModel.tagline,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textBlackFeint,
                          ),
                    ),
                    const Gap(22),
                    Text(
                      'Image Description',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.textBlack, fontSize: 18),
                    ),
                    const Gap(5),
                    Text(
                      imageModel.description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textBlackFeint,
                          ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
