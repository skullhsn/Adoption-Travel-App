import 'package:flutter/material.dart';
import '../models/plan.dart';
import '../widgets/plan_list.dart';
import '../widgets/create_plan_modal.dart';

class PlanManagerScreen extends StatefulWidget {
  @override
  _PlanManagerScreenState createState() => _PlanManagerScreenState();
}

class _PlanManagerScreenState extends State<PlanManagerScreen> {
  List<Plan> plans = [];

  void _addPlan(
    String name,
    String description,
    DateTime date,
    String priority,
  ) {
    setState(() {
      plans.add(
        Plan(
          name: name,
          description: description,
          date: date,
          priority: priority,
        ),
      );
    });
  }

  void _updatePlan(
    int index,
    String name,
    String description,
    DateTime date,
    String priority,
  ) {
    setState(() {
      plans[index] = Plan(
        name: name,
        description: description,
        date: date,
        priority: priority,
      );
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      plans[index].isCompleted = !plans[index].isCompleted;
    });
  }

  void _deletePlan(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adoption & Travel Plans")),
      body: PlanList(plans, _toggleComplete, _updatePlan, _deletePlan),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:
            () => showDialog(
              context: context,
              builder: (context) => CreatePlanModal(onSubmit: _addPlan),
            ),
      ),
    );
  }
}
