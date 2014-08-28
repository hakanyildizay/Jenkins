xcodebuild -alltargets clean

rm -rf "./JenkinsBuild/*"

xcodebuild -target JenkinsProject PROVISIONING_PROFILE="23559c84-3359-4394-96a7-f33f6e433287" CONFIGURATION_BUILD_DIR=JenkinsBuild

rm -rf "./JenkinsArchive/*"

xcodebuild -scheme JenkinsProject archive PROVISIONING_PROFILE="23559c84-3359-4394-96a7-f33f6e433287" CODE_SIGN_IDENTITY="iPhone Developer: Hakan YILDIZAY (7WW7WRHD7U)" -archivePath ./JenkinsArchive/JenkinsProject.xcarchive

rm -rf "./JenkinsIPAExport/*"

xcodebuild -exportArchive -exportFormat IPA -exportProvisioningProfile iOS\ Team\ Provisioning\ Profile:\ com.* -archivePath ./JenkinsArchive/JenkinsProject.xcarchive -exportPath ./JenkinsIPAExport/JenkinsProject.ipa