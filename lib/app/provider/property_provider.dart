import 'package:flutter/material.dart';
import 'package:homefinder/app/data/models/home_models.dart';

class PropertyProvider extends ChangeNotifier {
  List<Property> _properties = [];
  Property? _selectedProperty;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Property? get selectedProperty => _selectedProperty;
  List<Property> get properties => _properties;

  void selectProperty(Property property) {
    _selectedProperty = property;
    notifyListeners();
  }

  void clearSelectedProperty() {
    _selectedProperty = null;
    notifyListeners();
  }

  Future<void> fetchProperties() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _properties = await PropertyService.getProperties();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load properties ${e.toString()}';
      notifyListeners();
    }
  }

  Property? getPropertyById(String id) {
    try {
      return _properties.firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> refreshProperties() async {
    await fetchProperties();
  }
}
