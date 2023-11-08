import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/cart_item.dart';
import '../../Home/Models/product_data_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
    CartBloc():super(CartInitialState()){
        on<CartInitialEvent>(cartInitialEvent);
        on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    }

    FutureOr<void> cartInitialEvent(
        CartInitialEvent event, Emitter<CartState> emit) {
        emit(CartSuccessState(cartItems: cartItems));
    }

    FutureOr<void> cartRemoveFromCartEvent(
        CartRemoveFromCartEvent event, Emitter<CartState> emit) {
        cartItems.remove(event.productDataModel);
// emit()
        emit(CartSuccessState(cartItems: cartItems));
    }
}