// swift-tools-version:5.5
import PackageDescription
let package=Package(name:"Qimen",products:[.library(name:"Qimen",targets:["Qimen"])],dependencies:[.package(url:"https://github.com/6tail/lunar-swift.git",from:"1.0.0")],targets:[.target(name:"Qimen",dependencies:[.product(name:"LunarSwift",package:"lunar-swift")]),.testTarget(name:"QimenTests",dependencies:["Qimen"])])
