# Resources Test Failure

This repository contains a Swift package which includes a test target named `PackageTests` that includes a resources directory named  "Resources". On the command line with the Swift 5.3 tools on both Linux and macOS 11, this test runs fine when using `swift test`.

Also included is a Xcode project that contains apps created with the multiplatform app template. In the project there is a reference to the Swift package, and a test plan which runs the `PackageTests`. This is used as the test plan for the iOS and macOS app schemes.

When running the tests using the macOS app scheme on macOS 11, the tests pass successfully. 

When running the tests using the iOS app scheme, they fail to compile with the following message:

```
CodeSign /Volumes/RAM/Resources_Test_Failure-djmuzrkmznibwyaeaudfjnrgyfwd/Build/Products/Debug-iphonesimulator/Package_PackageTests.bundle (in target 'Package_PackageTests' from project 'Package')
    cd /Users/danielctull/Developer/Tests/Resources\ Test\ Failure
    export CODESIGN_ALLOCATE\=/Applications/Xcode12b1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
    
Signing Identity:     "-"

    /usr/bin/codesign --force --sign - --timestamp\=none /Volumes/RAM/Resources_Test_Failure-djmuzrkmznibwyaeaudfjnrgyfwd/Build/Products/Debug-iphonesimulator/Package_PackageTests.bundle

/Volumes/RAM/Resources_Test_Failure-djmuzrkmznibwyaeaudfjnrgyfwd/Build/Products/Debug-iphonesimulator/Package_PackageTests.bundle: bundle format unrecognized, invalid, or unsuitable
Command CodeSign failed with a nonzero exit code
```

