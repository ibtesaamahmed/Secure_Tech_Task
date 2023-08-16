import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:stc_flutter_task/view_models/bottom_sheet_view_model.dart';
import 'package:stc_flutter_task/view_models/products_view_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final int index;
  ProductDetailScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);
    final bottomSheetViewModel = Provider.of<BottomSheetViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double? animatedContainerHeight;
    if (bottomSheetViewModel.isExpanded && height > 600) {
      animatedContainerHeight = height * 0.4;
    } else if (!bottomSheetViewModel.isExpanded && height > 600) {
      animatedContainerHeight = height * 0.28;
    } else if (bottomSheetViewModel.isExpanded && height < 600) {
      animatedContainerHeight = height * 0.6;
    } else if (!bottomSheetViewModel.isExpanded && height < 600) {
      animatedContainerHeight = height * 0.45;
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.network(
              productViewModel.products[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: height * 0.05,
              left: width * 0.05,
              child: CustomSquareButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          Positioned(
              top: height * 0.05,
              right: width * 0.05,
              child: CustomSquareButton(
                icon: Icons.more_vert_outlined,
                onPressed: () {},
              )),
          Positioned(
            bottom:
                bottomSheetViewModel.isExpanded ? height * 0.4 : height * 0.28,
            left: width * 0.05,
            child: Text(
              '${productViewModel.products[index].price} AED',
              style: TextStyle(
                color: const Color(0xFF2A3F4B),
                fontSize: height < 600 ? 22 : 32,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                height: 1.09,
                letterSpacing: 0.40,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: animatedContainerHeight,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (bottomSheetViewModel.isExpanded) {
                  bottomSheetViewModel.collapseSheet();
                } else {
                  bottomSheetViewModel.expandSheet();
                }
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Icon(
                  bottomSheetViewModel.isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: const Color.fromRGBO(42, 179, 198, 1),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: height * 0.01,
                    left: width * 0.06,
                    right: width * 0.06),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.ios_share,
                                color: Color.fromRGBO(42, 179, 198, 1),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(42, 179, 198, 1),
                                fixedSize: Size(width * 0.7, height * 0.06)),
                            onPressed: () {},
                            child: const Text(
                              'Order Now',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 1.67,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF444A51),
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.50,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        productViewModel.products[index].description,
                        style: const TextStyle(
                          color: Color(0xFF828395),
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                          letterSpacing: 0.17,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: height < 600 ? height * 0.12 : height * 0.1,
                        width: double.infinity,
                        color: const Color.fromRGBO(241, 241, 241, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reviews (${productViewModel.products[index].ratingCount})',
                              style: const TextStyle(
                                color: Color(0xFF444A51),
                                fontSize: 15,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.50,
                              ),
                            ),
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.01, right: width * 0.1),
                                child: Text(
                                  productViewModel.products[index].rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: height < 600 ? 22 : 32,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
                              RatingBarIndicator(
                                itemBuilder: (context, _) {
                                  return const Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 224, 114, 1),
                                  );
                                },
                                unratedColor:
                                    const Color.fromRGBO(217, 217, 217, 1),
                                itemCount: 5,
                                rating: double.parse(
                                    productViewModel.products[index].rating),
                                itemSize: height * 0.05,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSquareButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  const CustomSquareButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: IconButton(
        icon: Icon(
          icon,
          color: const Color.fromRGBO(8, 41, 59, 1),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
