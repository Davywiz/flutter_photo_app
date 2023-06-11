import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_app/config/color_manager/color_manager.dart';
import 'package:flutter_photo_app/models/image_model.dart';
import 'package:flutter_photo_app/presentation/image_detail/image_details.dart';
import 'package:flutter_photo_app/state/images/images_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../state/images/images_notifier.dart';

class GridImageScreen extends ConsumerStatefulWidget {
  const GridImageScreen({super.key});
  static String get routeName => 'grid_image_screen';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GridImageScreenState();
}

class _GridImageScreenState extends ConsumerState<GridImageScreen> {
  static const _pageSize = 16;
  final _pagingController = PagingController<int, ImageModel>(
    firstPageKey: 16,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(imagesProvider.notifier).getImagesList(pageKey.toString());
      final newImageItems = ref.read(imagesProvider);
      if (newImageItems is ImagesLoaded) {
        final newItems = newImageItems.images;
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = _pagingController.firstPageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      } else if (newImageItems is ImagesError) {
        _pagingController.error = newImageItems.errorText;
      }
    });
  }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images Grid'),
        titleTextStyle: TextStyle(
          color: AppColors.darkColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: PagedGridView<int, ImageModel>(
              physics: const BouncingScrollPhysics(),
              pagingController: _pagingController,
              showNewPageProgressIndicatorAsGridChild: false,
              builderDelegate: PagedChildBuilderDelegate<ImageModel>(
                newPageProgressIndicatorBuilder: (context) => Center(
                  child: SpinKitFadingCircle(
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                ),
                firstPageProgressIndicatorBuilder: (context) => SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: SpinKitFadingCircle(
                      size: 25,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                animateTransitions: true,
                itemBuilder: (context, item, index) => InkWell(
                  borderRadius: BorderRadius.circular(23),
                  onTap: () {
                    context.goNamed(
                      ImageDetailScreen.routeName,
                      extra: item,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                      side: BorderSide(
                        width: 0.2,
                        color: AppColors.textBlackFeint,
                      ),
                    ),
                    child: Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 13.15,
                          bottom: 15,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(23),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(23),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(23),
                                  ),
                                  child: Hero(
                                    tag: item.id,
                                    child: CachedNetworkImage(
                                      imageUrl: item.imageUrl,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color: AppColors.darkColor,
                                        strokeWidth: 2,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisSpacing: 22.0,
                mainAxisSpacing: 12.0,
                crossAxisCount: mediaQuery.width > 650 ? 4 : 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
