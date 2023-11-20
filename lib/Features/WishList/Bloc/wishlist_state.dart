part of 'wishlist_bloc.dart';

@immutable
abstract class WishListState {}

class WishListInitialState extends WishListState {}
class WishListAddedState extends WishListState{}
class WishListRemovedState extends WishListState{}
class WishListErrorState extends WishListState{}

