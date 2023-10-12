class CartModel {
  String name;
  String description;
  double price;
  int quantity;
  String imagePath;
  CartModel(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      this.quantity = 1});
}
