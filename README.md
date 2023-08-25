# CodingTestApp

An `iOS` user list app that show the list of users and user's detail with user's posts.

### How it works

![](https://github.com/nilayGupt/CodingTest/blob/main/CodingTestApp/Assets/Assets.xcassets/gifs/appDemo.dataset/appDemo.gif)

### System requirements

- Mac OS
- XCode

### Installation

```sh
$ git clone https://github.com/nilayGupt/CodingTest/tree/main/CodingTestApp

$ Open '.xcodeproj' file in Xcode 14 or above

```
### Development

- `Project Structure`: Used MVVM structure.
- `Frameworks`: Used UIKit for user list screen. SwiftUI for user's detail and user's posts screen.
- `Dependencies`: No third party dependencies used.
- `Orientation`: Portrait only.

### Structure

```
├── CodingTestApp
│   ├── AppDelegate.swift
│   ├── Assets
│   │   └── Assets.xcassets
│   │       ├── AccentColor.colorset
│   │       │   └── Contents.json
│   │       ├── AppIcon.appiconset
│   │       │   └── Contents.json
│   │       └── Contents.json
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Constants
│   │   └── Constants.swift
│   ├── Modules
│   │   ├── UserDetails
│   │   │   ├── Model
│   │   │   │   └── PostsResponse.swift
│   │   │   ├── View
│   │   │   │   └── UserDetailView.swift
│   │   │   └── ViewModel
│   │   │       └── UserDetailViewModel.swift
│   │   └── UserList
│   │       ├── Model
│   │       │   ├── AddressModel.swift
│   │       │   ├── CompanyModel.swift
│   │       │   ├── GeoModel.swift
│   │       │   └── UsersResponse.swift
│   │       ├── View
│   │       │   ├── Cells
│   │       │   │   ├── UsersTableViewCell.swift
│   │       │   │   └── UsersTableViewCell.xib
│   │       │   └── UsersListViewController.swift
│   │       └── ViewModel
│   │           └── UsersViewModel.swift
│   ├── Plist
│   │   └── Info.plist
│   ├── SceneDelegate.swift
│   ├── Service
│   │   └── APIService.swift
│   └── Utility
│       └── Extensions
│           ├── ImageExtension.swift
│           └── TableViewCellExtension.swift
├── CodingTestApp.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── deq.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── deq.xcuserdatad
│           ├── xcdebugger
│           │   └── Breakpoints_v2.xcbkptlist
│           └── xcschemes
│               └── xcschememanagement.plist
└── CodingTestAppTests
    ├── ApiServiceTest.swift
    ├── CodingTestAppTests.swift
    ├── UsersListViewModelTest.swift
    └── content.json

34 directories, 33 files

```

- `CodingTestApp/assets`: It contains all type raw assets like pngs.
- `CodingTestApp/Base.lproj`: It contains Main storyboard and LaunchScreen storyboard.
- `CodingTestApp/constants`: It contains global level constants which are used throughout the application.
- `CodingTestApp/Modules`: It contains a complete feature and whole stuffs around that like specfic views, viewModels,models, repositories(CharacterRepository).
- `CodingTestApp/services`: It contains api services.

### Improvements

- Unit test cases for utility functions.
- UI improvements.
