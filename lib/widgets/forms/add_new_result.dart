import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/grade.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/providers/results_provider.dart';
import 'package:undergrad_tracker/widgets/forms/add_new_result_modal_actions.dart';
import 'package:undergrad_tracker/widgets/forms/add_new_result_modal_layout.dart';
import 'package:undergrad_tracker/widgets/forms/course_code_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_credits_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_grade_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_year_input.dart';
import 'package:undergrad_tracker/widgets/forms/couse_non_gpa_checkbox.dart';

class AddNewResult extends ConsumerStatefulWidget {
  const AddNewResult({super.key});

  @override
  ConsumerState<AddNewResult> createState() {
    return _AddNewResultState();
  }
}

class _AddNewResultState extends ConsumerState<AddNewResult> {
  late TextEditingController _courseCodeController;
  late TextEditingController _courseCreditsController;
  late TextEditingController _courseYearController;
  late bool _isNonGpa;
  Grade? _courseGrade;

  onChangeIsNonGpa(isChecked) {
    setState(() {
      _isNonGpa = isChecked;
    });
  }

  _showError(String title, String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay"),
              ),
            ],
          );
        });
  }

  onEnterResult() {
    if (_courseCodeController.text.isEmpty ||
        _courseCreditsController.text.isEmpty ||
        _courseYearController.text.isEmpty ||
        _courseGrade == null) {
      _showError("Error", "Input fields cannot be emptly.");
      return;
    }

    final result = Result(
      courseCode: _courseCodeController.text,
      courseYear: int.parse(_courseYearController.text),
      grade: _courseGrade!,
      credits: int.parse(_courseCreditsController.text),
      isNonGPA: _isNonGpa,
    );

    ref.read(resultsProvider.notifier).addResult(result);
    Navigator.of(context).pop();
  }

  _onSelectCourseGrade(selectedGrade) {
    _courseGrade = selectedGrade;
  }

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseCreditsController.dispose();
    _courseYearController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _courseCodeController = TextEditingController();
    _courseYearController = TextEditingController();
    _courseCreditsController = TextEditingController();
    _isNonGpa = false;
  }

  @override
  Widget build(BuildContext context) {
    return AddNewResultModalLayout(
      title: "Enter Result",
      courseCodeInput: CourseCodeInput(
        controller: _courseCodeController,
      ),
      courseYearInput: CourseYearInput(
        controller: _courseYearController,
      ),
      courseCreditsInput: CourseCreditsInput(
        controller: _courseCreditsController,
      ),
      courseGradeInput: CourseGradeInput(
        initialValue: _courseGrade,
        onSelected: _onSelectCourseGrade,
      ),
      courseNonGpaCheckbox: CourseNonGpaCheckbox(
        value: _isNonGpa,
        onChanged: onChangeIsNonGpa,
      ),
      modalActions: AddNewResultModalActions(
        onEnter: onEnterResult,
      ),
    );
  }
}
