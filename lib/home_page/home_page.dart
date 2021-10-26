import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intertoons_screening/datalayer/data_repo.dart';
import 'package:intertoons_screening/home_page/widgets/app_bar.dart';

import 'cubit/home_cubit.dart';
import 'maintab/maintab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(dataRepo: RepositoryProvider.of<DataRepository>(context))
            ..fetchData(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _navBarIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _navBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120), child: CustomAppBar()),
        body: [
          const MainTab(),
          const Center(
            child: Text("Search"),
          ),
          const Center(
            child: Text("Categories"),
          ),
          const Center(
            child: Text("cart"),
          ),
        ][_navBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.category,
                color: Colors.grey,
              ),
              label: 'Categorires',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: 'Cart',
            ),
          ],
          currentIndex: _navBarIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
