import 'package:bloc/bloc.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';
import 'package:intertoons_screening/datalayer/models/Banner/banner.dart';
import 'package:intertoons_screening/datalayer/models/carousel/carousel.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DataRepository dataRepo;
  HomeCubit({required this.dataRepo}) : super(const HomeState());

  fetchData() async {
    await fetchCarousal();
    await fetchBanner();
  }

  fetchCarousal() async {
    emit(state.copywith(carousel: await dataRepo.fetchCarousel()));
  }

  fetchBanner() async {
    emit(state.copywith(bannerList: await dataRepo.fetchBanners()));
  }
}
