import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/home_page/cubit/home_cubit.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<HomeCubit>();
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: PageView.builder(
          allowImplicitScrolling: true,
          itemCount: _cubit.state.carousel!.carousalImageList.length,
          itemBuilder: (context, index) => Image.network(
            _cubit.state.carousel!.carousalImageList[index],
            fit: BoxFit.cover,
          ),
        ));
  }
}
