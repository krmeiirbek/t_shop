import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';
import 'package:t_store/localization/tr_constants.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Products')
          .orderBy('TitleLowerCase')
          .where('TitleLowerCase', isGreaterThanOrEqualTo: query.toLowerCase().trim())
          .where('TitleLowerCase', isLessThanOrEqualTo: '${query.toLowerCase().trim()}\uf8ff')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(somethingWasWrongText.tr));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text(loadingText.tr));
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text(nothingFound.tr));
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            final product = ProductModel.fromSnapshot(document as DocumentSnapshot<Map<String, dynamic>>);
            return ListTile(
              onTap: () => Get.to(() => ProductDetailScreen(product: product)),
              leading: TCircularImage(image: product.thumbnail, isNetworkImage: true),
              title: Text(product.title),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Column();
  }
}
