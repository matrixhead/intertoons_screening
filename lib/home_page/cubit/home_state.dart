part of 'home_cubit.dart';

@immutable
class HomeState {
  final Carousel? carousel;
  final List<Banner>? bannerList;
  const HomeState({this.carousel, this.bannerList});

  HomeState copywith({Carousel? carousel, List<Banner>? bannerList}) {
    return HomeState(
      carousel: carousel ?? this.carousel,
      bannerList: bannerList ?? this.bannerList,
    );
  }
}
