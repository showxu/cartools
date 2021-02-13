<p align="center">
<img src="https://raw.githubusercontent.com/0xxd0/swift-cartools/master/static/media/AppIcon.png)" alt="swift-cartools" title="swift-cartools" width="300"/>
</p>

**swift-cartools** is a series of reverse tools (Command Line Tools, macOS Application, QuickLook Preview Extension, Framework) for Compiled Asset Catalogs (.car file) written in pure Swift.

<p align="center">
<a href="https://github.com/0xxd0/swift-cartools/actions?query=workflow%3Abuild"><img src="https://github.com/0xxd0/swift-cartools/workflows/build/badge.svg?branch=master"></a>
</p>


## Products Contains

- **macOS Application** written in Swift which allow you browsing renditions and exproting resources in Asset.car file.
- **Command Line Tools** for extract Asset.car file.
- macOS **Quick Look Preview Extension**.
- Underlying CartoolKit **Framework** which is based on PrivateFramework `CoreUI`, `CoreThemeDefinition`.


## App Previews and Screenshots

**Final Car Pro** is a macOS Application which give you the ability to browse, classify, filter renditions in compiled asset catalog and export resource files.

<!-- ![Rendition Filter](https://raw.githubusercontent.com/0xxd0/swift-cartools/master/static/media/feature_filter.png)
![Vector Annotation](https://raw.githubusercontent.com/0xxd0/swift-cartools/master/static/media/feature_vector.png) -->

### Install 

<!-- #### Download -->

#### Homebrew

Install the tap:

```bash
brew tap 0xxd0/tap
```

Install Application:

```bash
brew install Final\ Car\ Pro
```


## Command Line Tools

**cartool** is a swift Command Line Tools which allow you extract 

### Install

#### Homebrew

Install the tap:

```bash
brew tap 0xxd0/tap
```

Install Command Line Tool:

```bash
brew install cartool
```

<!-- #### MacPort -->

### Usage

```bash
USAGE: cartool <file-path> <output>

ARGUMENTS:
  <file-path>             The .car file path to parse. 
  <output>                Output dir to place extracted car file resources. 

OPTIONS:
  -h, --help              Show help information.
```


## Framework

**CartoolKit** is the underlying framework which empowered macOS Application and Command Line Tool. 

<!-- ### Install -->

<!-- #### Carthage  -->

<!-- #### CocoaPods. -->

<!-- #### Swift Package Manager -->


## License

This project is released under the **MIT License**.
