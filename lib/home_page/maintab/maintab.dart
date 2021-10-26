import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/home_page/cubit/home_cubit.dart';
import 'widgets/banner.dart';
import 'widgets/carousel.dart';

class MainTab extends StatelessWidget {
  const MainTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            if (state.carousel != null) const Carousel(),
            if (state.bannerList != null)
              ...state.bannerList!
                  .map<BannerView>((e) => BannerView(bannerData: e))
          ],
        );
      },
    );
  }
}
