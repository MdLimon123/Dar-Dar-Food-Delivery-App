import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String title;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFE6EEF7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedValue,
            decoration: const InputDecoration.collapsed(hintText: ''),
            hint: Text(
              widget.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            items: widget.options.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                _selectedValue = val;
              });

            },
          ),


          const SizedBox(height: 12),

        ],
      ),
    );
  }
}
