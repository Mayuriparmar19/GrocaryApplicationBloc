import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishListEvent,WishListState>{

  WishListBloc():super(WishListInitialState()){
    on<WishListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}