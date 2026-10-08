// gradeOf 分级器（switch）+ for-in 循环
// 扩展：处理边界 100/0 与非法输入

void runFlowDemo() {
  // 1. switch 分级（基础版）
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

  print('\n 成绩分级器扩展（边界 + 非法输入）');
  // 3. 扩展版：包含边界值 100、0 和非法输入（负数、>100、null）
  List<int?> testScores = [100, 0, 90, 60, 59, -5, 105, null];
  for (int? s in testScores) {
    print('分数 ${s ?? 'null'} -> ${gradeOfSafe(s)}');
  }
}

// 基础版 switch 表达式（Dart 3 语法）
String gradeOf(int score) {
  return switch (score) {
    >= 90 => 'A',
    >= 80 => 'B',
    >= 70 => 'C',
    >= 60 => 'D',
    _ => 'F',
  };
}

// 扩展版：处理边界 100/0 与非法输入
// - null -> '无效成绩'
// - < 0 或 > 100 -> '无效成绩'
// - 100 -> 'A+' （满分特殊标识）
// - 0 -> 'F' （0 分单独处理，避免落入 default）
// - 其余按区间分级
String gradeOfSafe(int? score) {
  // 先判空和范围
  if (score == null || score < 0 || score > 100) {
    return '无效成绩';
  }
  return switch (score) {
    100 => 'A+', // 边界：满分
    >= 90 => 'A',
    >= 80 => 'B',
    >= 70 => 'C',
    >= 60 => 'D',
    0 => 'F', // 边界：0 分
    _ => 'F', // 1~59 分
  };
}
