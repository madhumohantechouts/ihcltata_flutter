import 'package:flutter/widgets.dart';
import 'package:ihcltata/model/drawer_model.dart';

class DrawerStateProvider with ChangeNotifier{
  final drawerList = <DrawerModel>[
    DrawerModel(title:'BRANDS'),
    DrawerModel(title:'COMPANY'),
    DrawerModel(title:'INVESTORS'),
    DrawerModel(title:'DEVELOPMENT'),
    DrawerModel(title:'RESPONSIBILITY'),
    DrawerModel(title:'CAREERS'),
    DrawerModel(title:'PRESSROOM'),
    DrawerModel(title:'CONTACT'),
  ];
}