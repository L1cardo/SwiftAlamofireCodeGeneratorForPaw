# Swift 5 + Alamofire Code Generator (Paw Extension)

[![Build Code Generator](https://github.com/L1cardo/SwiftAlamofireCodeGeneratorForPaw/actions/workflows/build.yml/badge.svg)](https://github.com/L1cardo/SwiftAlamofireCodeGeneratorForPaw/actions/workflows/build.yml)

A [Paw Extension](https://paw.cloud/extensions/) that generates Swift 5 code for the [Alamofire 5](https://github.com/Alamofire/Alamofire) library.
## Note

This repo is modified from official paw repo [luckymarmot/Paw-SwiftAlamofireCodeGenerator](https://github.com/luckymarmot/Paw-SwiftAlamofireCodeGenerator), but since they have been ignoring [my PR](https://github.com/luckymarmot/Paw-SwiftAlamofireCodeGenerator/pull/11) for almost a year, so I created this repo for those who might use this code generator.



## Installation

1. Download the `SwiftAlamofireCodeGenerator.zip` file from [release page](https://github.com/L1cardo/SwiftAlamofireCodeGeneratorForPaw/releases/latest)

2. Extract the zip file and you will get a folder named `com.licardo.PawExtensions.SwiftAlamofireCodeGenerator`

3. Place the folder to `/Users/<User>/Library/Containers/com.luckymarmot.Paw/Data/Library/Application Support/com.luckymarmot.Paw/Extensions`, make sure change `<User>` to your user name

4. Restart Paw

## Development

### Build & Install

```shell
npm install
cake build
cake install
```

### Watch

During development, watch for changes:

```shell
cake watch
```
## License

This Paw Extension is released under the [MIT License](LICENSE). Feel free to fork, and modify!

## Credits

* [Mustache.js](https://github.com/janl/mustache.js/), also released under the MIT License
* [URI.js](http://medialize.github.io/URI.js/), also released under the MIT License
