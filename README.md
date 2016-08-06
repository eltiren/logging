# Simple logging framework for Swift projects

Set logging level in your AppDelegate like

```swift
Log.level = .verbose
Log.enabled = true
```

And use anywhere like 

```swift
Log.verbose("Some message")
Log.warning("Some message")
Log.error("Some message")
```
