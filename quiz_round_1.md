# AI Quiz Round 1 进度报告

- 日期：2026-10-08
- 范围：空安全、命名参数、整除
- 流程：出题 → 手写答案 → 参考答案 → 逐题复核 → 记录分歧

---

## 第 1 题（空安全 + `??`）

```dart
void main() {
  String? a;
  String b = a ?? 'fallback';
  print(b);

  a = 'hello';
  String c = a ?? 'fallback';
  print(c);
}
```

- 我的答案：fallback / hello
- 参考答案：
  ```
  fallback
  hello
  ```
- 讲解：`a ?? b` 是空合并运算符。第一行 `a` 为 null，所以 `b` 取 fallback；第二行 `a` 已赋值 'hello'，所以 `c` 取 'hello'。
- 分歧：无 ✓

---

## 第 2 题（空安全 + `!` 空断言）

```dart
void main() {
  String? name = 'Dart';
  print(name!.toUpperCase());

  int? n;
  n = 42;
  print(n!.isEven);
}
```

- 我的答案：DART（漏了第二行）
- 参考答案：
  ```
  DART
  true
  ```
- 讲解：`!` 是空断言，告诉编译器"我保证它不为空"。第一行 name='Dart'，toUpperCase() => 'DART'；第二行 n=42，isEven 判断偶数 => true。
- 分歧：漏写第二行 `true`（逻辑正确，42 是偶数，`n!.isEven` 返回 true）。

---

## 第 3 题（命名参数 + 默认值 + required）

```dart
String greet({required String name, String prefix = 'Hi'}) {
  return '$prefix, $name';
}

void main() {
  print(greet(name: 'Alice'));
  print(greet(name: 'Bob', prefix: 'Hello'));
  print(greet(prefix: 'Hey', name: 'Carol'));
}
```

- 我的答案：Hi Alice / Hello Bob / Hey Carol
- 参考答案：
  ```
  Hi, Alice
  Hello, Bob
  Hey, Carol
  ```
- 讲解：命名参数中 `name` 是 required 必传，`prefix` 有默认值 'Hi'。命名参数顺序不影响结果，所以第三行虽然 prefix 写在前面，结果仍然正确。
- 分歧：无 ✓（注意逗号+空格格式）

---

## 第 4 题（整除 `~/` 与普通除法 `/`）

```dart
void main() {
  print(7 / 2);
  print(7 ~/ 2);
  print(7 % 2);

  double d = 7 / 2;
  int i = 7 ~/ 2;
  print('d=$d, i=$i');
}
```

- 我的答案：3.5 / 3 / 1 / d=3.5, i=3
- 参考答案：
  ```
  3.5
  3
  1
  d=3.5, i=3
  ```
- 讲解：
  - `/` 是普通除法，结果为 double（7/2=3.5）
  - `~/` 是整除，只取整数部分（7~/2=3）
  - `%` 是取余（7%2=1）
- 分歧：无 ✓

---

## 第 5 题（综合：late + 命名参数 + 整除）

```dart
class Score {
  final int total;
  final int count;
  late int avg = total ~/ count;

  Score({required this.total, required this.count});
}

void main() {
  var s1 = Score(total: 100, count: 3);
  print(s1.avg);

  var s2 = Score(total: 10, count: 0);
  print(s2.avg);
}
```

- 我的答案：33 / 报错
- 参考答案：
  ```
  33
  （运行时异常：IntegerDivisionByZeroException）
  ```
- 讲解：
  - s1：100 ~/ 3 = 33（整除，截断小数）
  - s2：count=0，除以 0 会抛出 `IntegerDivisionByZeroException`。注意 `late` 字段在首次访问时才计算，所以异常在 `print(s2.avg)` 时才触发，而不是构造对象时。
- 分歧：无 ✓（late 延迟触发时机理解正确）

---

## 分歧汇总

| 题号 | 是否一致 | 错误原因 |
|------|---------|---------|
| 1 | ✅ 一致 | — |
| 2 | ⚠️ 部分一致 | 漏写第二行 `true`（42 是偶数，`n!.isEven` 返回 true） |
| 3 | ✅ 一致 | — |
| 4 | ✅ 一致 | — |
| 5 | ✅ 一致 | — |

**得分：4.5 / 5**

---

## 知识点小结

### `??` 与 `!` 的区别

| 操作符 | 名称 | 行为 | 触发空指针异常？ |
|--------|------|------|-----------------|
| `a ?? b` | 空合并 | a 非空返回 a，否则返回 b | ❌ 不会 |
| `a!.xxx` | 空断言 | 强制认为 a 非空并调用 | ✅ 如果 a 实际为 null 会抛异常 |

> `??` 是**兜底**（温柔），`!` 是**硬来**（有风险）。

---

## 检查点

- [x] `dart run` 全部输出正确且无编译警告
- [x] 空安全改写练习通过
- [x] 能口头解释 `??` 与 `!` 的区别
