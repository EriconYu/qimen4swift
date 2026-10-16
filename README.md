# qimen4swift

Swift 原生奇门遁甲排盘 SDK，历法使用 `LunarSwift`。要求 Swift 5.5+，运行时不依赖 Node.js 或其他语言。

```swift
let input: [String: Any] = [
    "year": 2026, "month": 4, "day": 10, "hour": 14, "minute": 0,
    "timezone": "Asia/Shanghai",
]
let chart = try calculateQimen(input)
let canonical = try canonicalQimen(input)
```

`calculateQimen` 返回完整结构化盘面，`canonicalQimen` 返回规范 JSON。当前算法版本为 `qimen-zhuanpan-chaibu-v1`。
