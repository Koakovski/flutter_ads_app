String priceInCentsFormatter(int priceInCents) {
  double price = priceInCents / 100;

  String stringPrice = price.toStringAsFixed(2);
  stringPrice = stringPrice.replaceAll('.', ',');

  return 'R\$ $stringPrice';
}
