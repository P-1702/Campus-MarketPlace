import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  String productname = "Please enter your product name";
  String productdesc = "Please enter your product description";
  String dropdownvalue = 'Books';
  String category = "Others";
  var items = ['Books', 'Furnitures', 'Sports', 'Electronics', 'Others'];
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Choose product pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sell your products"),
          centerTitle: true,
        ),
        // backgroundColor: kPrimaryColor,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              TextFormField(
                onChanged: (value) => print(value),
                onSaved: (value) {
                  productname = value;
                  print(productname);
                },
                decoration: InputDecoration(
                  hintText: productname,
                  labelText: "Product name",
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Choose Category"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      autofocus: true,
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  color: Color(0XFF8B8B8B), fontSize: 15),
                            ));
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                          category = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              TextFormField(
                onChanged: (value) => print(value),
                onSaved: (value) {
                  productdesc = value;
                  print(productdesc);
                },
                decoration: InputDecoration(
                  hintText: productdesc,
                  labelText: "Product Description",
                ),
                minLines: 3,
                maxLines: 12,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryLightColor,
                    elevation: 0,
                    side: BorderSide(
                      width: 0.5,
                      color: Colors.black,
                    )),
                child: Text(
                  "Pick images",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: loadAssets,
              ),
              Expanded(
                child: buildGridView(),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
