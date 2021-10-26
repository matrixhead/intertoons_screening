import 'package:flutter/material.dart';
import 'package:intertoons_screening/datalayer/models/Banner/bannertypes/image_banner/imagebanner.dart';
import 'package:intertoons_screening/datalayer/models/Banner/bannertypes/product_list/product_list.dart';
import 'package:intertoons_screening/datalayer/models/Banner/banner.dart'
    as model;

class BannerView extends StatelessWidget {
  final model.Banner bannerData;
  const BannerView({
    required this.bannerData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final banner = bannerData.data;
    if (banner is ProductList) {
      return SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        banner.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.1,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("VIEW ALL"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: banner.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/productpage',
                                arguments: banner.items[index].id);
                          },
                          child: Card(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Column(
                                children: [
                                  if (banner.items[index].image != null)
                                    Expanded(
                                      child: Image.network(
                                        banner.items[index].image!,
                                      ),
                                    )
                                  else
                                    Image.asset(
                                        "assets/images/omanphone_icon.png"),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      banner.items[index].name,
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      "OMR " +
                                          banner.items[index].price.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (banner is ImageBanner) {
      return Image.network(
        banner.file,
      );
    }
    return Container();
  }
}
