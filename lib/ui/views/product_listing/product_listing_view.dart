import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_listing_viewmodel.dart';

class ProductListingView extends StackedView<ProductListingViewModel> {
  const ProductListingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductListingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ProductListingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductListingViewModel();
}
