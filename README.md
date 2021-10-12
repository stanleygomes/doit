# Do it!

A todo app for everything. Come to the flutter side 🌑

*******
Table of contents

 0. [Requirements](#requirements)
 1. [How to get Started](#startup)
 2. [Gitflow recommendations](#gitflow)
 3. [Patterns and libs](#patterns)
 4. [Samples and tutorials of use](#tutorials)
 5. [Project structure](#projetcstructure)
 6. [Licence](#license)
*******

<div id='requirements'/>

## :pencil: Requirements

This app supports flutter sdk >= 2.12.0 and < 3.0.0, as it says in `pubspec.yaml` file. Then make sure you have [flutter properly installed](https://flutter.dev/docs/get-started/install).

<div id='startup'/>

## :rocket: Startup

Step by step to get this up and running

### Clone repo and go to project folder

```
git clone https://github.com/stanleygomes/doit.git && cd doit
```

### Install dependencies

```sh
flutter pub get
```

### Open app

Make sure you have flutter extension package in your vscode editor, then you can run or debug your app.

Finally, you can choose a device or web to preview the app.


<div id='gitflow'/>

## :trident: Git flow

To file a new a feature

- create a branch from `master` branch. Use the pattern: `feature/description`
- file a pull request on `master` branch
- since your PR is aproved, it will be merged to `master` branch
- in a moment in time we'll create a release, using the pattern: `release/vX.X.X`

<div id='patterns'/>

## :heavy_check_mark: Patterns

These are some of patterns definitions to help us to keep a default arquitecture.

Working on...

- Linter: ????
- i18n: ????
- Date and time: ????
- Test: ????
- Http Request: ????
- Authentication: ????

<div id='tutorials'/>

## :books: Tutorials

Some useful tutorials to improve nodevader's features:

- Main features: [check here](https://from-tatooine.web.app/nodevader-first-release/)
- Deploy to firebase functions: [check here](https://from-tatooine.web.app/deploy-nodejs-firebase)

<div id='projetcstructure'/>

## :open_file_folder: Project structure

Basic folder structure

- **assets**: Images, styles, fonts...
- **src/config**: App config, constants, configuration and i18n
- **src/resources**: API calls, data repository layer
- **src/routes**: Configuration for app routing
- **src/pages**: App pages (compound of widgets)
- **src/widgets**: As the name says... here we get widgets
- **src/utils**: Utilities and modules implementations

<div id='license'/>

## :scroll: License 

```
MIT license. Copyright (c) 2021 Stanley.
For more information, see the LICENSE file.
```
