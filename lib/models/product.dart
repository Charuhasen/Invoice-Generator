class Product {
  int _quantity;
  String _description;
  double _unitPrice;
  double _amount;

  Product({
    int? quantity,
    String? description,
    double? unitPrice,
    double? amount,
  })  : _quantity = quantity ?? 0,
        _description = description ?? '',
        _unitPrice = unitPrice ?? 0.0,
        _amount = amount ?? 0.0;

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
    _amount = _quantity * _unitPrice;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get unitPrice => _unitPrice;

  set unitPrice(double value) {
    _unitPrice = value;
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }
}
