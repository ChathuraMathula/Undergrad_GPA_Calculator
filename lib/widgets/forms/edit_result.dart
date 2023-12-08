import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:undergrad_tracker/models/grade.dart';
import 'package:undergrad_tracker/models/result.dart';
import 'package:undergrad_tracker/providers/results_provider.dart';
import 'package:undergrad_tracker/widgets/forms/add_new_result_modal_layout.dart';
import 'package:undergrad_tracker/widgets/forms/course_code_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_credits_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_grade_input.dart';
import 'package:undergrad_tracker/widgets/forms/course_year_input.dart';
import 'package:undergrad_tracker/widgets/forms/couse_non_gpa_checkbox.dart';
import 'package:undergrad_tracker/widgets/forms/edit_result_modal_actions.dart';

class EditResult extends ConsumerStatefulWidget {
  const EditResult({super.key, required this.result});

  final Result result;

  @override
  ConsumerState<EditResult> createState() {
    return _EditResultState();
  }
}

class _EditResultState extends ConsumerState<EditResult> {
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

  _showSnackBar({required message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(message),
      ),
    );
  }

  onSaveResult() {
    if (_courseCodeController.text.isEmpty ||
        _courseCreditsController.text.isEmpty ||
        _courseYearController.text.isEmpty ||
        _courseGrade == null) {
      _showError("Error", "Input fields cannot be emptly.");
      return;
    }

    final result = Result(
      courseCode: _courseCodeController.text,
      courseYear: _courseYearController.text,
      grade: _courseGrade!,
      credits: _courseCreditsController.text,
      isNonGPA: _isNonGpa,
    );

    ref.read(resultsProvider.notifier).updateResult(result);
    Navigator.of(context).pop();
    _showSnackBar(
      message: '${result.courseCode} updated successfully.',
    );
  }

  _onSelectCourseGrade(selectedGrade) {
    _courseGrade = selectedGrade;
  }

  @override
  void initState() {
    super.initState();
    _courseCodeController =
        TextEditingController(text: widget.result.courseCode);
    _courseYearController =
        TextEditingController(text: widget.result.courseYear);
    _courseCreditsController =
        TextEditingController(text: widget.result.credits);
    _isNonGpa = widget.result.isNonGPA;
    _courseGrade = widget.result.grade;
  }

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseCreditsController.dispose();
    _courseYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddNewResultModalLayout(
      title: "Edit Result",
      courseCodeInput: CourseCodeInput(
        controller: _courseCodeController,
        readOnly: true,
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
      modalActions: EditResultModalActions(
        onSave: onSaveResult,
      ),
    );
  }
}
