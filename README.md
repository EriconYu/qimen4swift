# qimen4swift

Swift 奇门遁甲排盘 SDK，SwiftPM 资源内置经过版本锁定的排盘引擎。要求 Swift 5.5+ 和 Node.js 20+。

```swift
let input: [String: Any] = [
    "year": 2026, "month": 4, "day": 10, "hour": 14, "minute": 0,
    "timezone": "Asia/Shanghai",
]
let chart = try calculateQimen(input)
let canonical = try canonicalQimen(input)
```

`calculateQimen` 返回完整结构化盘面，`canonicalQimen` 返回规范 JSON。当前算法版本为 `qimen-zhuanpan-chaibu-v1`。
