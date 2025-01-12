part of 'common_widgets_imports.dart';

extension IntSizedBoxExtensions on int {
  SizedBox get heightBox => SizedBox(height: h);
  SizedBox get widthBox => SizedBox(width: w);
}

/* extension DoubleSizedBoxExtensions on double {
  SizedBox get heightBox => SizedBox(height: this);
  SizedBox get widthBox => SizedBox(width: this);
} */
