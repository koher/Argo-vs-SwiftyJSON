Argo vs SwiftyJSON
===================================

Sample project for comparison between [Argo](https://github.com/thoughtbot/Argo) and [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON).

Initialization
-----------------------------------

Execute the following command using [Carthage](https://github.com/Carthage/Carthage).

```bash
carthage bootstrap
```

To use Xcode 7 to bulild the libraries, execute the following command before `carthage bootstrap`.

```bash
sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer
```

Parsing JSONs
-----------------------------------

- [Argo.swift](ArgoVsSwiftyJSON/Argo.swift): How to parse JSONs with Argo
- [SwiftyJSON.swift](ArgoVsSwiftyJSON/SwiftyJSON.swift): How to parse JSONs with SwiftyJSON

Run
-----------------------------------

Run the test by `command + u` on Xcode 7.

Tests written in the following 2 files are executed.

- [ArgoTest.swift](ArgoVsSwiftyJSONTests/ArgoTest.swift)
- [SwiftyJSONTest.swift](ArgoVsSwiftyJSONTests/SwiftyJSONTest.swift)
