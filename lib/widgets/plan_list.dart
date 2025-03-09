import 'package:flutter/material.dart';
import '../models/plan.dart';

class PlanList extends StatelessWidget {
  final List<Plan> plans;
  final Function(int) onToggleComplete;
  final Function(int, String, String, DateTime, String) onUpdate;
  final Function(int) onDelete;

  PlanList(this.plans, this.onToggleComplete, this.onUpdate, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return GestureDetector(
          onDoubleTap: () => onDelete(index),
          onLongPress: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Text("Edit Plan"),
                    content: TextField(
                      onSubmitted: (value) {
                        onUpdate(
                          index,
                          value,
                          plan.description,
                          plan.date,
                          plan.priority,
                        );
                        Navigator.pop(context);
                      },
                      decoration: InputDecoration(hintText: "Enter new name"),
                    ),
                  ),
            );
          },
          child: Dismissible(
            key: Key(plan.name),
            onDismissed: (_) => onToggleComplete(index),
            background: Container(color: Colors.green),
            child: ListTile(
              title: Text(plan.name),
              subtitle: Text("${plan.description} - ${plan.priority}"),
              trailing: Icon(
                plan.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
              ),
            ),
          ),
        );
      },
    );
  }
}
