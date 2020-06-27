# Resources Test Failure

Filed as FB7805949 on 27th June 2020.

## About this failure

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

This seems to have been a problem for a while as this [stack overflow](https://stackoverflow.com/questions/29271548/code-sign-error-bundle-format-unrecognized-invalid-or-unsuitable) question has the same issue with a "Resources" directory in 2015.

## Feedback report

### Basic Information

**Please provide a descriptive title for your feedback:**

Xcode fails to build Swift package test target for iOS when the tests include a resources directory named "Resources"

**Which area are you seeing an issue with?**

Xcode

**What type of feedback are you reporting?**

Incorrect/Unexpected Behavior

**Is this Feedback related to a Lab, Engineering Session, or Forum Topic from WWDC20?**

Yes, a Lab

**Please provide the lab title:**

Xcode Open Hours lab

### Details

**What version of Xcode are you using?**

Xcode 12 beta 1

### Description

**Please describe the issue:**

I have a swift package with a test target which includes a resources directory named "Resources". This builds and runs fine on the command line with `swift test`. In an Xcode project I have referenced the swift package and added the test target to a test plan. When running these tests in Xcode they fail for iOS, although they work fine for macOS.

**Please list the steps you took to reproduce the issue:**

* Open the attached sample project 

* Run the tests for the iOS scheme  
* See them fail with a code sign issue

**What did you expect to happen?**

I would expect it to pass, but it seems Xcode has special treatment for a Resources directory on iOS, so at the worst I would expect an error stating that directories named "Resources" are not supported on iOS.

**What actually happened?**

Xcode fails with an obscure code sign error.