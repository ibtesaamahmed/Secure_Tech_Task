import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:stc_flutter_task/view_models/products_view_model.dart';
import 'package:stc_flutter_task/views/home/rounded_appbar_widget.dart';
import 'package:stc_flutter_task/views/product_detail/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _loadProducts(BuildContext context) async {
    await Provider.of<ProductViewModel>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  void initState() {
    print('hemmm');
    Future.delayed(Duration.zero).then((_) => _loadProducts(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const RoundedBottomAppBar(),
      body: FutureBuilder(
        future: _loadProducts(context),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: const Color(0xFFF7F8FA),
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Consumer<ProductViewModel>(
                  builder: (context, value, child) => value.products.isEmpty
                      ? const Center(
                          child: Text('No Products Available'),
                        )
                      : ListView.builder(
                          itemCount: value.products.length,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.03),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(index),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        value.products[index].imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: height * 0.28,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.05,
                                            right: width * 0.05,
                                            bottom: height * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${value.products[index].price} AED',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w700,
                                                height: 1.45,
                                              ),
                                            ),
                                            RatingBarIndicator(
                                              itemBuilder: (context, _) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Color.fromRGBO(
                                                      255, 224, 114, 1),
                                                );
                                              },
                                              unratedColor:
                                                  const Color.fromRGBO(
                                                      217, 217, 217, 1),
                                              itemCount: 5,
                                              rating: double.parse(
                                                  value.products[index].rating),
                                              itemSize: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                value.products[index].title,
                                style: const TextStyle(
                                  color: Color(0xFF444A51),
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 1.57,
                                  letterSpacing: 0.17,
                                ),
                              ),
                              Text(
                                value.products[index].description,
                                style: const TextStyle(
                                  color: Color(0xFF08293B),
                                  fontSize: 10,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                  letterSpacing: 0.17,
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              Container(
                                  height: 1, color: const Color(0xFFD7D7D7)),
                            ],
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}
