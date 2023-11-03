import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/ProductModel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool descTextShowFlag = false;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Data?;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(width: 28.w),
            Text(
              "Product Details",
              style: TextStyle(fontSize: 20.sp, color: AppColors.blueColor),
            ),
            const Spacer(),
            Icon(Icons.search, color: AppColors.blueColor, size: 20.sp),
            SizedBox(width: 28.w),
            Icon(Icons.shopping_cart_outlined,
                color: AppColors.blueColor, size: 20.sp)
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: CarouselSlider.builder(
                itemCount: product?.images?.length ?? 1,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(),
                        color: Colors.blueGrey),
                    child: CachedNetworkImage(
                      imageUrl: product?.images?[index] ?? "",
                      // fit: BoxFit.fitWidth,
                      fit: BoxFit.fill,
                      width: 398.w,
                      height: double.infinity,

                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    ),
                  );
                },
                options: CarouselOptions(
                  scrollPhysics: const FixedExtentScrollPhysics(),
                  height: MediaQuery.of(context).size.height * 0.33,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              )),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(children: [
                      Text(product?.brand?.name ?? "",
                          style: const TextStyle(fontSize: 18)),
                      const Spacer(),
                      Text("EGP ${product?.price.toString() ?? ""}",
                          style: TextStyle(fontSize: 18))
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(
                                  color: Colors.blueGrey, width: 1.w)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Text(
                              "${product?.sold.toString() ?? " "} Sold",
                              style: const TextStyle(fontSize: 18),
                            ),
                          )),
                      const SizedBox(width: 10),
                      Icon(Icons.star, color: AppColors.yellowColor),
                      Text(product?.ratingsAverage.toString() ?? "",
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 5),
                      Text("(${product?.ratingsQuantity.toString() ?? ""})",
                          style: const TextStyle(fontSize: 14)),
                      SizedBox(width: 70.w),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 7.h),
                          decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                        color: Colors.white, width: 2.w)),
                                child: const Icon(Icons.remove,
                                    color: Colors.white)),
                            const SizedBox(width: 20),
                            const Text("1",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            const SizedBox(width: 20),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                        color: Colors.white, width: 2.w)),
                                child:
                                    const Icon(Icons.add, color: Colors.white))
                          ])),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Text("Description",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.blueColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 30.w),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          descTextShowFlag = !descTextShowFlag;
                        });
                      },
                      child: Text(
                        maxLines: descTextShowFlag == true ? 6 : 2,
                        product?.description?.replaceAll("\n", " ") ?? "",
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 14, color: AppColors.blueColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0.w.h),
                    child: Text("Size",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Text('Total Price'),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "EGP ${product?.price.toString() ?? " "}",
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  backgroundColor: const Color(0xff004182),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.h, horizontal: 32.w)),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  const Icon(Icons.add_shopping_cart_outlined),
                                  SizedBox(
                                    width: 45.w,
                                  ),
                                  const Text(
                                    'Add to cart',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
