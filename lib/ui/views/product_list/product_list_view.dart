import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:tezda/core/model/product/product.dart';
import 'package:tezda/ui/common/app_colors.dart';
import 'package:tezda/ui/views/product_list/component/cart_barge.dart';

import 'product_list_viewmodel.dart';

class ProductListView extends StackedView<ProductListViewModel> {
  final TextEditingController search = TextEditingController();

   ProductListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: search,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      onChanged: (value) =>
                          viewModel.onSearchProduct2(value),
                      onSaved: (email) {},
                      decoration: const InputDecoration(
                        hintText: "search",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  CustomBadge(cartLength: viewModel.filterResult.length.toString())
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.filterResult.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SingleProd(model: viewModel, product: product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(BuildContext context) =>
      ProductListViewModel();

  @override
  void onViewModelReady(ProductListViewModel viewModel) {
    viewModel.onSearchProduct('');
    super.onViewModelReady(viewModel);
  }
}

class SingleProd extends StatelessWidget {
  final Product product;

  final ProductListViewModel model;
  const SingleProd({super.key, required this.product, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Hero(
        tag: product.title,
        child: Material(
            child: InkWell(
          onTap: () {
            model.navigateToProductListDetailView(product);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: product.title,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    AppText(text: product.category),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: product.rating?.rate ?? 0.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      itemSize: 25,
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      text: "£${product.price}",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      {super.key, required this.text, this.fontSize, this.fontWeight});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
