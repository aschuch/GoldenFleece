# GoldenFleece

![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)

A collection of extensions of common types for the [Argo](https://github.com/thoughtbot/Argo) JSON parser.

> In Greek mythology, Argo was the ship on which Jason and the Argonauts sailed from Iolcos to retrieve the Golden Fleece.

# Usage

Given the following JSON, GoldenFleece lets us directly parse an `NSURL` from the `profile_picture` and a `CLLocation` from the `location` using Argo/Runes. 

```json
{
	"name": "Alex",
	"profile_picture": "http://example.com/picture.png",
	"location": {
		"lat": 48.11,
		"lon": 16.55
	}
}
```

```swift
import Argo
import Runes
import GoldenFleece

struct User {
    let name: String
    let profilePictureURL: NSURL
    let location: CLLocation
}

extension User: Decodable {
    static func create(name: String)(profilePictureURL: NSURL)(location: CLLocation) -> User {
        return self(name: name, profilePictureURL: profilePictureURL, location: location)
    }
    
    static func decode(j: JSON) -> Decoded<User> {
        return User.create
            <^> j <| "name"
            <*> j <| "profile_picture"	// directly decodes String into NSURL
            <*> j <| "location"			// directly decodes location into CLLocation
    }
}
```

## `Decodeable` Extensions

GoldenFleece collects helpful extensions for common types to be directly used with Argo/Runes. Currently only a handful extensions are supported, but pull requests are more than welcome.

| Class											| Description 						|
|----											|----								|
| [CLLocation](Argonaut/CLLocation+Argo.swift) 	| Converts a JSON dictionary `{"lat": 48.2, "lon": 16.36}` to a `CLLocation`. |
| [NSURL](Argonaut/NSURL+Argo.swift) 			| Converts a JSON string to `NSURL` |

## Installation

#### Carthage

Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "aschuch/GoldenFleece"
```

Then run `carthage update`.

#### Manually

Just drag and drop the three `.swift` files in the `GoldenFleece` folder into your project.

## Tests

Open the Xcode project and press `⌘-U` to run the tests.

Alternatively, all tests can be run from the terminal using [xctool](https://github.com/facebook/xctool).

```bash
xctool -scheme GoldenFleeceTests -sdk iphonesimulator test
```

## Todo

* CocoaPods support

## Contributing

* Create something awesome, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)


## Contact

Feel free to get in touch.

* Website: <http://schuch.me>
* Twitter: [@schuchalexander](http://twitter.com/schuchalexander)
