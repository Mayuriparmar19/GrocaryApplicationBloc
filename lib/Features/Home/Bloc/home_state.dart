part of 'home_bloc.dart';

 @immutable
abstract class HomeSate {}

abstract class HomeActionState extends HomeSate {}

class HomeInitialState extends HomeSate {}

class HomeLoadingState extends HomeSate {}

class HomeLoadedState extends HomeSate {
  final List<ProductDataModel> products;

  HomeLoadedState(this.products);
}

class HomeErrorState extends HomeSate {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
