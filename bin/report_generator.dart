// 命名参数设计：实验报告生成器
// 设计一个生成实验报告的函数，使用命名参数，给出三种调用方式

void runReportGeneratorDemo() {
  // 调用方式1：只传必填参数（其他用默认值）
  String r1 = generateReport(title: '电路欧姆定律验证');
  print(r1);

  print('---');

  // 调用方式2：传入部分可选参数
  String r2 = generateReport(title: '单摆测重力加速度', author: '张三', score: 92);
  print(r2);

  print('---');

  // 调用方式3：传入全部参数（顺序任意，命名参数不依赖顺序）
  String r3 = generateReport(
    date: '2026-10-08',
    score: 88,
    title: '杨氏模量测定',
    author: '李四',
    passed: true,
  );
  print(r3);
}

/// 生成实验报告
///
/// 命名参数设计：
/// - [title]  实验标题（必填，required）
/// - [author] 作者（可选，默认 '匿名'）
/// - [date]   日期（可选，默认 '未填写'）
/// - [score]  成绩（可选，默认 null，表示未评阅）
/// - [passed] 是否通过（可选，默认 null，由成绩自动判断）
String generateReport({
  required String title,
  String author = '匿名',
  String date = '未填写',
  int? score,
  bool? passed,
}) {
  // 成绩为空时显示"未评阅"，否则显示分数
  String scoreText = score != null ? '$score 分' : '未评阅';

  // 通过状态：
  // - 显式传入 passed 就用它
  // - 未传 passed 且有成绩：>=60 通过
  // - 未传 passed 且无成绩：未评阅
  String passText;
  if (passed != null) {
    passText = passed ? '通过 ✓' : '不通过 ✗';
  } else if (score != null) {
    passText = score >= 60 ? '通过 ✓' : '不通过 ✗';
  } else {
    passText = '未评阅';
  }

  return '【实验报告】\n'
      '标题：$title\n'
      '作者：$author\n'
      '日期：$date\n'
      '成绩：$scoreText\n'
      '状态：$passText';
}
