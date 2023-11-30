import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_e_d_i_t_widget.dart' show TransactionEDITWidget;
import 'package:flutter/material.dart';

class TransactionEDITModel extends FlutterFlowModel<TransactionEDITWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rmajsi7c' /* Please enter an amount */,
      );
    }

    return null;
  }

  // State field(s) for SpentAt widget.
  FocusNode? spentAtFocusNode;
  TextEditingController? spentAtController;
  String? Function(BuildContext, String?)? spentAtControllerValidator;
  // State field(s) for budget widget.
  String? budgetValue;
  FormFieldController<String>? budgetValueController;
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonController;
  String? Function(BuildContext, String?)? reasonControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    spentAtFocusNode?.dispose();
    spentAtController?.dispose();

    reasonFocusNode?.dispose();
    reasonController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
