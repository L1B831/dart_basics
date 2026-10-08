import 'types_demo.dart';
import 'func_demo.dart';
import 'flow_demo.dart';
import 'null_safe_demo.dart';
import 'report_generator.dart';

void main(List<String> arguments) {
  print('===== types_demo =====');
  runTypesDemo();

  print('\n===== func_demo =====');
  runFuncDemo();

  print('\n===== flow_demo =====');
  runFlowDemo();

  print('\n===== null_safe_demo =====');
  runNullSafeDemo();

  print('\n===== report_generator =====');
  runReportGeneratorDemo();
}
