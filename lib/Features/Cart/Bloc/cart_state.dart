part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}


