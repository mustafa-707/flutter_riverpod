# Use for setup default Firebase instance before build
#!/bin/bash

echoerr() {
    red=$(tput setaf 1)
    echo "${red}✘ $@" 1>&2
}

echosucc() {
    green=$(tput setaf 2)
    echo "${green}✔ $@" 1>&2
}

echon() {
    reset=$(tput sgr0)
    echo "${reset}$@" 1>&2
}

setAndroidEnv() {
    echon "Setting up Android firebase project..."

    GOOGLE_FILE_ANDROID_ENV=./android/app/google-services-$ENV.json
    GOOGLE_FILE_ANDROID=./android/app/google-services.json

    echon "Checking firebase env file exist.."
    if test -f "$GOOGLE_FILE_ANDROID_ENV"; then
        echosucc "$GOOGLE_FILE_ANDROID_ENV exists"
        rm $GOOGLE_FILE_ANDROID
        cp $GOOGLE_FILE_ANDROID_ENV $GOOGLE_FILE_ANDROID
        echosucc "Android firebase project set to: google-services-$ENV.json"
    else
        echoerr "$GOOGLE_FILE_ANDROID_ENV doesn't exists"
    fi
}

setIosEnv() {
    echon "Setting up iOS firebase project..."

    GOOGLE_FILE_IOS_ENV=./ios/Runner/GoogleService-Info-$ENV.plist
    GOOGLE_FILE_IOS=./ios/Runner/GoogleService-Info.plist

    echon "Checking iOS firebase env file exist.."
    if test -f "$GOOGLE_FILE_IOS_ENV"; then
        echosucc "$GOOGLE_FILE_IOS_ENV exists"
        rm $GOOGLE_FILE_IOS
        cp $GOOGLE_FILE_IOS_ENV $GOOGLE_FILE_IOS
        echosucc "iOS firebase project set to: GoogleService-Info-$ENV.plist"
    else
        echoerr "$GOOGLE_FILE_IOS_ENV doesn't exists"
    fi
}

COMMAND=$1
if [ "$COMMAND" == "env" ]; then
    GOOGLE_FILE_ANDROID=./android/app/google-services.json
    GOOGLE_FILE_IOS=./ios/Runner/GoogleService-Info.plist
    ANDROID_ENV=$(sed -n '5p' $GOOGLE_FILE_ANDROID)
    IOS_ENV=$(sed -n '18p' $GOOGLE_FILE_IOS)

    prefix='"project_id": "'
    suffix='",'
    ANDROID_ENV=$(echo $ANDROID_ENV | sed 's/ *$//g')
    ANDROID_ENV=$(echo $ANDROID_ENV | sed -e "s/^$prefix//" -e "s/$suffix$//")

    prefix='<string>'
    suffix='<\/string>'
    IOS_ENV=$(echo $IOS_ENV | sed 's/ *$//g')
    IOS_ENV=$(echo $IOS_ENV | sed -e "s/^$prefix//" -e "s/$suffix$//")

    echosucc "Android: ${ANDROID_ENV}"
    echosucc "iOS: ${IOS_ENV}"
    exit 1
fi

while getopts e:p: option; do
    case "${option}" in
    e) ENV=${OPTARG} ;;
    p) PLATFORM=${OPTARG} ;;
    esac
done

echon "Arguments: Environment (-e): $ENV | Run Platform (-p): $PLATFORM"

if test -z "$ENV"; then
    echoerr "Empty environment (-e) argument!"
    exit 1
fi

if [ -n "$PLATFORM" ] && [ "$PLATFORM" != "ios" ] && [ "$PLATFORM" != "android" ]; then
    echoerr "Invalid platofrom (-p) argument: $PLATFORM"
    exit 1
fi

flutter clean
flutter packages get

if test -z "$PLATFORM" || [ "$PLATFORM" == "ios" ]; then
    setIosEnv
fi

if test -z "$PLATFORM" || [ "$PLATFORM" == "android" ]; then
    setAndroidEnv
fi
