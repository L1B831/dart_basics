// gradeOf 分级器（switch）+ for-in 循环

void runFlowDemo() {
  // 1. switch 分级
  List<int> scores = [95, 85, 75, 65, 55];
  for (int s in scores) {
    print('分数 $s -> 等级 ${gradeOf(s)}');
  }

  // 2. for-in 遍历集合
  List<String> fruits = ['apple', 'banana', 'cherry'];
  print('for-in 遍历:');
  for (String f in fruits) {
    print('  - $f');
  }
}

// switch 表达式（Dart 3 语法）
String gradeOf(int score) {
  return switch (score) {
    >= 90 => 'A',
    >= 80 => 'B',
    >= 70 => 'C',
    >= 60 => 'D',
    _ => 'F',
  };
}
