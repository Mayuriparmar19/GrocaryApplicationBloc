import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title:const Text(('Cart Items')),
            ),
           body: BlocConsumer<CartBloc,CartState>(
             bloc: CartBloc(),
             listener: (context,state){

             },
             listenWhen:  (previous,current) => current is CartActionState,
             buildWhen:  (previous,current)  => current is CartActionState,
             builder: (context,state){
               return Container();
             },

           )
    );
  }
}
