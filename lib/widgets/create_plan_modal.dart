import 'package:flutter/material.dart';

class CreatePlanModal extends StatefulWidget {
  final Function(String, String, DateTime, String) onSubmit;

  CreatePlanModal({required this.onSubmit});

  @override
  _CreatePlanModalState createState() => _CreatePlanModalState();
}

class _CreatePlanModalState extends State<CreatePlanModal> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _priority = "Medium";

  void _submit() {
    widget.onSubmit(
      _nameController.text,
      _descriptionController.text,
      _selectedDate,
      _priority,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create Plan"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Plan Name"),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
          DropdownButton<String>(
            value: _priority,
            onChanged: (newValue) => setState(() => _priority = newValue!),
            items:
                ["Low", "Medium", "High"]
                    .map(
                      (priority) => DropdownMenuItem(
                        value: priority,
                        child: Text(priority),
                      ),
                    )
                    .toList(),
          ),
          ElevatedButton(
            child: Text("Select Date"),
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2022),
                lastDate: DateTime(2030),
              );
              if (picked != null) setState(() => _selectedDate = picked);
            },
          ),
        ],
      ),
      actions: [TextButton(onPressed: _submit, child: Text("Add Plan"))],
    );
  }
}
