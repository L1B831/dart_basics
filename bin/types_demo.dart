// 变量、字符串插值、空安全四件套（?  /  !  /  late  /  required）

void runTypesDemo() {
  // 1. 变量与类型推断
  var name = 'Dart';
  String greeting = 'Hello';
  int count = 3;
  print('[$greeting] 变量演示: $name x $count => 插值结果 ${greeting.toUpperCase()}');

  // 2. 可空类型 ?
  String? nullableName;
  print('可空类型 ?: nullableName = $nullableName');

  // 3. 空断言 !（确保非空时使用）
  String forced = nullableName ?? '默认值';
  print('空断言/空合并: forced = $forced');

  // 4. late 延迟初始化
  late String lateName;
  lateName = '延迟赋值成功';
  print('late 延迟初始化: $lateName');

  // 5. required 命名参数（演示构造函数）
  final user = User(name: 'Alice', age: 20);
  print('required 命名参数: ${user.info}');
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  String get info => 'User(name=$name, age=$age)';
}
