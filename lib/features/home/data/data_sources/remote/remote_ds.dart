import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/models/CartModel.dart';
import 'package:ecommerce/features/home/data/models/CategoryBrandsModel.dart';

abstract class HomeTabRemoteDS {
  Future<Either<Failures, CategoryModel>> getCategories();
  Future<Either<Failures, CategoryModel>> getBrands();
  Future<Either<Failures, CartModel>> addToCart(String productId, String token);
}
