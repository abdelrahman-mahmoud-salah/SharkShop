import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/common/widget/custom_container_linear_customer.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSales extends StatefulWidget {
  const BannerSales({super.key});

  @override
  State<BannerSales> createState() => _BannerSalesState();
}

class _BannerSalesState extends State<BannerSales> {
  List<String> banners = [
    "https://tse2.mm.bing.net/th?id=OIP.nXqz9NeACN38rRr1AtLiMQHaHa&pid=Api&P=0&h=220",
    "https://tse3.mm.bing.net/th?id=OIP.5BW1_exWBWLYoaovSb5QgQHaFY&pid=Api&P=0&h=220",
    "https://tse1.mm.bing.net/th?id=OIP.9EPw9SskcC9syVJIsVlBgQHaE0&pid=Api&P=0&h=220"
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder: (context, index, realIndex) {
              return CustomContainerLinearCustomer(
                height: 160.h,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: banners[index],
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 160.h,
              reverse: true,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            )),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.asMap().entries.map((entry) {
            return Container(
              width: 15.w,
              height: 4.h,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: activeIndex == entry.key
                    ? context.mycolors.bluePinkLight
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
