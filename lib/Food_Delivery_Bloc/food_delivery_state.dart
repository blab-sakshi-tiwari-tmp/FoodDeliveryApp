part of 'food_delivery_bloc.dart';

abstract class FoodDeliveryBlocState {
  int value = 0; // The state value

  FoodDeliveryBlocState({required this.value});
}

class FoodDeliveryBlocInitial extends FoodDeliveryBlocState {
  FoodDeliveryBlocInitial() : super(value: 0);
}

class FoodDeliveryBlocIndexChangedState extends FoodDeliveryBlocState {
  FoodDeliveryBlocIndexChangedState(int value) : super(value: value);
}
