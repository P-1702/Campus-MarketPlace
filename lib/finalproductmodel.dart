import 'package:multi_image_picker2/multi_image_picker2.dart';

class ProductModel {
  String productname;
  String productdesc;
  String cost;
  List<Asset> imagelist;
  String categoryname;

  ProductModel(
      {this.categoryname,
      this.productname,
      this.productdesc,
      this.cost,
      this.imagelist});
}
