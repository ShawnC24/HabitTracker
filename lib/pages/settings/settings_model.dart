import '/components/theme_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for theme component.
  late ThemeModel themeModel;

  @override
  void initState(BuildContext context) {
    themeModel = createModel(context, () => ThemeModel());
  }

  @override
  void dispose() {
    themeModel.dispose();
  }
}
