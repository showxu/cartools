<p align="center">
<img src="https://raw.githubusercontent.com/0xxd0/swift-cartools/master/static/media/AppIcon.png" alt="swift-cartools" title="swift-cartools" width="256"/>
</p>

**swift-cartools** is a series of reverse tools for Compiled Asset Catalogs (.car file) written in pure Swift.

<p align="center">
<a href="https://github.com/0xxd0/swift-cartools/actions?query=workflow%3Abuild"><img src="https://github.com/0xxd0/swift-cartools/workflows/build/badge.svg?branch=master"></a>
</p>


## Products Contains

- **macOS Application**, which written in pure Swift, let you browsing renditions and exproting resources in Asset.car file.
- **Command Line Tools**, extracting Asset.car file in terminal.
- **QuickLook Preview Extension**, inspector for car file without open it.
- **Framework**, The underlying infrastructure called CartoolKit. which is based on PrivateFramework CoreUI, CoreThemeDefinition.


## macOS App Previews and Screenshots

<p align="leading">
<img src="https://raw.githubusercontent.com/0xxd0/swift-cartools/master/static/media/feature_vector.png" alt="Final Car Pro" title="Final Car Pro" width="500"/>
</p>

**Final Car Pro** is a macOS Application which give you the ability to browse, classify, filter renditions in compiled asset catalog and export resource files.

### Features 

- [x] Document based car file browser.
- [x] Filter renditions by rendition type. 
- [x] Search renditions by file name and rendition name. 
- [x] Group renditions by rendition name for exported resources.
- [x] Drag to export.
- [x] Vector resource annotation.
- [x] SVG resource display and export.
- [x] PDF resource display and export.
- [ ] Dark mode support.

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

**cartool** is a swift Command Line Tools which allow you extract the resource of car file in termial. 

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
