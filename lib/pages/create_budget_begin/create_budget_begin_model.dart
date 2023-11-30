import '/flutter_flow/flutter_flow_util.dart';
import 'create_budget_begin_widget.dart' show CreateBudgetBeginWidget;
import 'package:flutter/material.dart';

class CreateBudgetBeginModel extends FlutterFlowModel<CreateBudgetBeginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'afvob7y1' /* Please enter an amount */,
      );
    }

    return null;
  }

  // State field(s) for budgetName widget.
  FocusNode? budgetNameFocusNode;
  TextEditingController? budgetNameController;
  String? Function(BuildContext, String?)? budgetNameControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    budgetNameFocusNode?.dispose();
    budgetNameController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
