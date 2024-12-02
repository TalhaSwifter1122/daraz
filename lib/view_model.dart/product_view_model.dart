import 'package:flutter/foundation.dart';
import 'package:daraz_web/Model/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  // Products List
  final List<Product> _products = [
    Product(name: "iPhone 14", price: 1200, category: "New Arrivals"),
    Product(name: "Samsung Galaxy S23", price: 1000, category: "Best Sellers"),
    Product(name: "Dell XPS Laptop", price: 1500, category: "Discounts"),
    Product(name: "AirPods Pro", price: 200, category: "Popular"),
    Product(name: "AirPods Pro 3", price: 200, category: "Popular"),
    Product(name: "AirPods Pro 1", price: 200, category: "Popular"),
    Product(name: "Dell Pro", price: 200, category: "Popular"),
    Product(name: "Samsung Pro", price: 200, category: "Discounts"),
    Product(name: "Hp Pro", price: 200, category: "Discounts"),
  ];

  // Filters and Selection States
  final List<String> _filters = [
    "New Arrivals",
    "Best Sellers",
    "Discounts",
    "Popular",
  ];
  final List<bool> _selectedFilters = [false, false, false, false];

  String _searchQuery = "";

  // Getters
  List<String> get filters => _filters;
  List<bool> get selectedFilters => _selectedFilters;

  // Filtered Products
  List<Product> get filteredProducts {
    // Apply search filter
    List<Product> results = _products;
    if (_searchQuery.isNotEmpty) {
      results = results
          .where((product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    // Apply category filters if any are selected
    final activeFilters = _filters
        .asMap()
        .entries
        .where((entry) => _selectedFilters[entry.key])
        .map((entry) => entry.value)
        .toList();

    if (activeFilters.isNotEmpty) {
      results = results
          .where((product) => activeFilters.contains(product.category))
          .toList();
    }

    return results;
  }

  // Update Search Query
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Update Filter Selection
  void updateFilterSelection(int index, bool isSelected) {
    _selectedFilters[index] = isSelected;
    notifyListeners();
  }
}
