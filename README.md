# 51 Degrees / PHP / Common API

A mirrored version of 51 Degree's `php/common-api` with an updated `composer.json`.

## Update when 51 Degrees releases

Run `update.sh` when 51 Degrees releases a new version

```
$ ./update.sh v3.2.20.4
```

## Add to composer

Update your projects `composer.json` with a new `repositories` entry and require
the needed version.

```
"repositories": [
        {
            "type": "git",
            "url": "git@git.dev.kochava.com:lib-php/fifty-one-degrees-php-common-api.git"
        },
]
...
"require": {
    "fiftyonedegrees/php-common-ap": "~3.0.0@stable"
}
...
```
