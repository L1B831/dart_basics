// 空安全改写练习：给定含隐患的可空代码，改写为安全版本并逐处解释

void runNullSafeDemo() {
  print('--- 隐患代码（注释说明，不执行）---');
  print('隐患1: name!.length 在 name 为 null 时抛运行时异常');
  print('隐患2: 可空参数 s 直接 s.length 会编译报错');
  print('隐患3: late 字段未初始化就访问抛 LateInitializationError');

  print('\n--- 安全改写 ---');
  safeExample();
}

// 辅助函数：返回可空字符串，避免类型提升干扰 ?. 演示
String? maybeString(bool hasValue) => hasValue ? 'Dart' : null;

// ========== 安全改写版本 ==========
void safeExample() {
  // 改写1：用 ?. 安全调用 + ?? 兜底
  // maybeString(false) 返回 null，演示 ?. 的作用
  String? name1 = maybeString(false);
  int len1 = name1?.length ?? 0;
  print('name 长度（null 时兜底）: $len1'); // 输出 0

  String? name2 = maybeString(true);
  int len2 = name2?.length ?? 0;
  print('name 长度（有值时）: $len2'); // 输出 4

  // 改写2：函数内部做空判断再处理
  print('getLength(null) = ${getLengthSafe(null)}'); // 输出 0
  print('getLength("hello") = ${getLengthSafe('hello')}'); // 输出 5

  // 改写3：required 命名参数 + this. 初始化形式保证非空
  final u = SafeUser(name: 'Alice');
  print('SafeUser.name = ${u.name}'); // 输出 Alice

  // 改写4：late 字段延迟初始化（首次访问前赋值）
  final buffer = LateBuffer();
  buffer.init('延迟数据');
  print('LateBuffer.data = ${buffer.data}'); // 输出 延迟数据
}

// 安全函数：参数可空，内部用 ?? 兜底
int getLengthSafe(String? s) {
  return s?.length ?? 0; // s 为 null 时返回 0
}

// 安全类：required 命名参数 + 初始化形式（推荐写法）
class SafeUser {
  final String name; // 非空 final，构造时必须传

  SafeUser({required this.name});
}

// 安全类：late 延迟初始化（适合无法在构造时确定值的场景）
class LateBuffer {
  late final String data; // late final 只能赋值一次

  void init(String value) {
    data = value; // 在首次访问前赋值，避免 LateInitializationError
  }
}
