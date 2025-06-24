import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/colors.dart';

class XDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final Function(String) onChanged;
  final String? initialValue;

  const XDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  State<XDropdown> createState() => _XDropdownState();
}

class _XDropdownState extends State<XDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: XColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: widget.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedValue = value;
                    });
                    widget.onChanged(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
