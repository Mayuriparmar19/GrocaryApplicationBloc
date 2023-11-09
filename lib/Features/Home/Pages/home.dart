import 'package:bloc_application_demo/Features/Cart/Pages/cart.dart';
import 'package:bloc_application_demo/Features/Home/Pages/product_tile_widget.dart';
import 'package:bloc_application_demo/Features/WishList/Pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishListScreen()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedState:
            final successState = state as HomeLoadedState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: HomeBloc(),
                        productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
