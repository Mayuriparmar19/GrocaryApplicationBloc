import '../Models/product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent,HomeSate>{
  HomeBloc():super(HomeInitialState());


  
}