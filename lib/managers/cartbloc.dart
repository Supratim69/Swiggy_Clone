import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final String itemName;
  final double price;

  AddToCartEvent(this.itemName, this.price);
}

abstract class CartState {}

class CartLoadedState extends CartState {
  final List<CartItem> cartItems;
  final double total;

  CartLoadedState(this.cartItems, this.total);
}

class CartEmptyState extends CartState {}

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartItem> cartItems = [];
  double total = 0.0;

  CartBloc() : super(CartEmptyState());

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddToCartEvent) {
      cartItems.add(CartItem(event.itemName, event.price));
      total += event.price;
      yield CartLoadedState(cartItems, total);
    }
  }
}

class CartItem {
  final String itemName;
  final double price;

  CartItem(this.itemName, this.price);
}
