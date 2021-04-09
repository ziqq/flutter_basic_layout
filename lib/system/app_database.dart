import 'package:injectable/injectable.dart';
import 'package:flutter_basic_layout/datamodels/address.dart';

@lazySingleton
class AppDatabase {
  Future<Address> getCurrentAddress() {}
}
