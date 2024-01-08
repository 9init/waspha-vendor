import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';

class Vehicle {
  final VehicleType type;
  final String name;
  final String image;

  Vehicle({required this.type, required this.name, required this.image});
}

final List<Vehicle> vehicleList = [
  Vehicle(
      type: VehicleType.Walk, name: 'Walk', image: MyAssets.svg.mensShoes.path),
  Vehicle(
      type: VehicleType.Skate,
      name: 'Skate',
      image: MyAssets.svg.skateboard.path),
  Vehicle(
      type: VehicleType.Bicycle,
      name: 'Bicycle',
      image: MyAssets.svg.bicycle.path),
  Vehicle(
      type: VehicleType.Scooter,
      name: 'Scooter',
      image: MyAssets.svg.scooter.path),
  Vehicle(
      type: VehicleType.Moto, name: 'Moto', image: MyAssets.svg.motorbike.path),
  Vehicle(type: VehicleType.Car, name: 'Car', image: MyAssets.svg.car.path),
  Vehicle(
      type: VehicleType.Pickup,
      name: 'Pickup',
      image: MyAssets.svg.pickupTruck.path),
  Vehicle(type: VehicleType.Van, name: 'Van', image: MyAssets.svg.van.path),
  Vehicle(
      type: VehicleType.Truck,
      name: 'Truck',
      image: MyAssets.svg.pickupTruck.path),
];
