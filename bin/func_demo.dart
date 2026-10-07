// 命名参数的 enroll 函数 + 箭头函数

void runFuncDemo() {
  // 命名参数调用
  String result1 = enroll(name: '张三', course: 'Flutter');
  String result2 = enroll(name: '李四', course: 'Dart', level: '高级');
  print('命名参数 enroll: $result1');
  print('命名参数 enroll(带可选): $result2');

  // 箭头函数
  int add(int a, int b) => a + b;
  print('箭头函数 add(3, 5) = ${add(3, 5)}');

  bool isEven(int n) => n % 2 == 0;
  print('箭头函数 isEven(4) = ${isEven(4)}');
}

// 命名参数：必选用 required，可选给默认值
String enroll({
  required String name,
  required String course,
  String level = '入门',
}) {
  return '$name 报名了「$course」($level)';
}
