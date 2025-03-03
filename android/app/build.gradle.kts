plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // id("com.google.gms.google-services")
}
// def keystoreProperties = new Properties()
// def keystorePropertiesFile = rootProject.file('key.properties')
// if (keystorePropertiesFile.exists()) {
//        keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
// }

android {
    namespace = "com.example.flutter_templete"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.flutter_templete"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }
    // signingConfigs {
    //     release {
    //         keyAlias keystoreProperties['keyAlias']
    //         keyPassword keystoreProperties['keyPassword']
    //         storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
    //         storePassword keystoreProperties['storePassword']
    //     }
    // }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug") // "release"
            isMinifyEnabled = true
            isShrinkResources = true
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // implementation(platform("com.google.firebase:firebase-bom:33.10.0"))
}
