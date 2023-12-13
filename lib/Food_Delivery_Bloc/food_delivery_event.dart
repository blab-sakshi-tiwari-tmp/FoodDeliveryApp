part of 'food_delivery_bloc.dart';

abstract class FoodDeliveryBlocEvent {
  const FoodDeliveryBlocEvent();
}

class FoodDeliveryIndexChangedEvent extends FoodDeliveryBlocEvent {
  final int indexChanged;

  FoodDeliveryIndexChangedEvent(this.indexChanged);
}
