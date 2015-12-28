# Argsplit

[![Build Status](https://travis-ci.org/evanlucas/argsplit-swift.svg)](https://travis-ci.org/evanlucas/argsplit-swift)

Swift port of https://github.com/evanlucas/argsplit

Convert a string of arguments into an array

## Example

```swift
import Argsplit

let input = "git clone https://github.com/evanlucas/node-launchctl.git"
let out = Argsplit(inputString: input).parse()
// => ["git", "clone", "https://github.com/evanlucas/node-launchctl.git"]
```

## Author

Evan Lucas

## License

MIT (See `LICENSE` for more INFO)
