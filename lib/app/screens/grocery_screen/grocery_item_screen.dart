import 'package:flutter/material.dart';

import '../../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  // 1
  final Function(GroceryItem) onCreate;
  // 2
  final Function(GroceryItem) onUpdate;
  // 3
  final GroceryItem? originalItem;
  // 4
  final bool isUpdating;

  GroceryItemScreen(
      {required this.onCreate, required this.onUpdate, this.originalItem})
      : isUpdating = (originalItem != null);

  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add grocery item screen state properties

  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final originalItem = widget.originalItem;
    if (originalItem != null) {
// 2
      _nameController.addListener(() {
        setState(() {
          _name = _nameController.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.orange);

    // TODO: Add buildNameField()
    // TODO: Add buildImportanceField()
    // TODO: ADD buildDateField()
    // TODO: Add buildTimeField()
    // TODO: Add buildColorPicker()
    // TODO: Add buildQuantityField()
  }
}
