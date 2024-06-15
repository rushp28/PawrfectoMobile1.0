class TPricingCalculator {

  // Calculates the total price including tax and shipping cost according to the location
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // Calculates the shipping cost according to the location
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  // Calculates the tax amount according to the location
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  // Gets the tax rate for the given location
  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  // Gets the shipping cost for the given location
  static double getShippingCost(String location) {
    return 5.00;
  }
}