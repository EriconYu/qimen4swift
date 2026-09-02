// swift-tools-version:5.5
import PackageDescription
let package=Package(name:"Qimen",products:[.library(name:"Qimen",targets:["Qimen"])],targets:[.target(name:"Qimen",resources:[.copy("engine.cjs")]),.testTarget(name:"QimenTests",dependencies:["Qimen"])])
