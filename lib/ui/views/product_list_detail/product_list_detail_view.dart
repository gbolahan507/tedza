import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:tezda/core/model/product/product.dart';
import 'package:tezda/ui/views/product_list/product_list_view.dart';

import 'product_list_detail_viewmodel.dart';

class ProductListDetailView extends StackedView<ProductListDetailViewModel> {
  final Product product;
  const ProductListDetailView({Key? key, required this.product})
      : super(key: key);

  @override
  Widget builder(BuildContext context, ProductListDetailViewModel viewModel,
      Widget? child) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            AppText(
                text: "£${product.price}",
                fontSize: 20,
                fontWeight: FontWeight.w700),
            const SizedBox(width: 20)
          ],
          backgroundColor: Colors.white,
          title: Column(
            children: [
              AppText(
                text: product.category,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        body: ListView(children: [
          AnimatedSlide(
            offset: viewModel.doAnimation
                ? const Offset(0, 0)
                : const Offset(0, .25),
            duration: const Duration(seconds: 1),
            child: Hero(
                tag: 1,
                child: SizedBox(
                    height: 400,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ))),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: product.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: 10),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: product.rating?.rate ?? 0.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.only(left: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      itemSize: 25,
                      onRatingUpdate: (rating) {},
                    ),
                    AppText(
                        text: "(${product.rating?.rate ?? 0.0})",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                const SizedBox(height: 10),
                AppText(text: product.description),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: AppText(
                      text: "Add To Cart (£${product.price})",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ]));
  }

  @override
  ProductListDetailViewModel viewModelBuilder(BuildContext context) =>
      ProductListDetailViewModel();

  @override
  void onViewModelReady(ProductListDetailViewModel viewModel) {
    viewModel.enableAnimation();
    super.onViewModelReady(viewModel);
  }
}
