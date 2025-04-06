#Tooling

The contents of this folder are for tooling that needs additional work to install after cloning the repository.

## `pre-push`

A sample pre-push script for use as the corresponding github hook script. You can install the script by copying it into
`$REPO/.git/hooks`. It will prevent pushing to server if the last commits require being amended by `swiftformat` or
require tweaks to avoid running afoul of `swiftlint`. Both tools are assumed to be installed, in `$PATH` and up to date.

## `PackageValidation.yml`

A simple GitHub Actions workflow to validate a package project's updates. It's already pre-installed in
`.github/workflows/PackageValidation.yml`

To get it working you will need the following steps:

2. Protect your `main` branch from manual merges and merges from non-approved or non validated PRs.
3. Add the following variables to the repository (see https://docs.github.com/en/actions/learn-github-actions/variables#creating-configuration-variables-for-a-repository)
for further instructions.
    - RUNNER = <name of the github runner to use to run the validation. "macos-14" as of this writing>
    - TOOLPATH = <path to the tools to use to run the validation. "
/Applications/Xcode_15.2.app/Contents/Developer" as of this writing.
    - PLATFORMS = JSON array of the platforms that the project will build for and the destination hardware as returned
  by `xcodebuild -list`. This is a maximalist example, remove platforms and update SDKs as needed:
```
[
  {
    "name": "macOS",
    "destination": "platform=macOS"
  },
  {
    "name": "Catalyst",
    "destination": "platform=macOS,variant=Mac Catalyst"
  },
  {
    "name": "iOS",
    "destination": "platform=iOS Simulator,OS=17.2,name=iPhone 15 Pro"
  },
  {
    "name": "tvOS",
    "destination": "platform=tvOS Simulator,OS=17.2,name=Apple TV 4K (3rd generation)"
  },
  {
    "name": "visionOS",
    "destination": "platform=visionOS Simulator,OS=1.0,name=Apple Vision Pro"
  },
  {
    "name": "watchOS",
    "destination": "platform=watchOS Simulator,OS=10.2,name=Apple Watch Series 9 (45mm)"
  }
]
```
