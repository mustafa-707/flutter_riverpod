# Flutter + riverpod App Templete

## Changing Enviroment

Use this command to switch between enviroment

```bash
sh setenv.sh -e ENV_TYPE
```

`ENV_TYPE` is can be `staging` or `production`

> Note : switching enviroment will auto-generate Firebase files : json for Android , plist for iOS !!
> run this to generate a Freezed Models : flutter pub run build_runner build --delete-conflicting-outputs && fluttergen -b build.yaml
