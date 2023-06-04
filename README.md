# Flutter Etude _(가상인맥)_

![Flutter](https://img.shields.io/badge/Flutter-3.10.0-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0.0-0175C2?style=flat-square&logo=dart&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-14.3.1-147EFB?style=flat-square&logo=xcode&logoColor=white)
<img src="https://img.shields.io/badge/Android SDK-33.0.2-3DDC84?style=flat-square&logo=androidstudio&logoColor=white" alt="Android SDK"/>

`플러터 에뛰드(습작)`는 Flutter 공부용으로 **유사** 데이팅앱을 만든 프로젝트입니다. Open API인 [Random User Generator](https://randomuser.me/)를 이용했습니다.

## Background

한 번이라도 1人 개발 혹은 적은 수의 팀원으로 모바일 앱을 기획해 본 사람이라면 iOS, 안드로이드를 모두 커버해야 한다는 부담이 작지 않다는 사실에 공감하실 것입니다.
저는 **'작지만 사랑받을 수 있는 아이디어'만 있다면 특정 플랫폼에 강하게 종속되어 있는 기술을 쓰지 않더라도 시장에서 살아남는 제품을 만들 수 있다**고 생각합니다.
아니 오히려 아이디어를 검증하는 단계에선 기술이 많이 들어갈수록 본질을 흐릴 수 있다고 우려합니다.
진작에 빨리 망해버릴 수 있었던 아이디어가 기술로 화려하게 포장되어 한참 뒤늦게 망할 위험이 있기 때문입니다.

그래서 저는 크로스플랫폼 프레임워크인 Flutter를 초창기부터 흥미롭게 지켜 보고 있었습니다.
정확히는 보고만 있었습니다.
그러는 와중에 엔씨소프트 사내 모바일 앱 개발팀, [merging](https://merging.world/)과 같이 Flutter로 이미 훌륭한 수준의 서비스를 배포하는 팀들을 보며 저도 공부를 시작했습니다.
무작정 Dart 강의 하나, Flutter 기초 강의 하나를 듣고 복습용으로 이 프로젝트를 만들었습니다.
동시에 **Flutter로 현재 iOS와 안드로이드 버전을 따로 관리 중인 SBS 사내 모바일 앱을 크로스플랫폼으로 전환할 수 있을지, 개인적인 토이프로젝트를 만들어 배포하는 데 부족함이 없는 수준인지를 검증**해 보고자 이런저런 실험을 해봤습니다.

짧은 식견이지만 쓸만한 앱이 되려면 적어도 아래 기능 정도는 원활하게 돌아가야 한다고 생각합니다.
따라서 해당 기능을 지원하는 안정적인 라이브러리가 있는지를 찾아보고 직접 사용해봤습니다.
| No. | 기능 | 패키지 | 버전 |
| :--: | -- | -- | -- |
| 1 | HTTP 통신 | [http](https://pub.dev/packages/http) | ^0.13.5 |
| 2 | JSON Serialization/Deserialization | [dart:convert](https://api.dart.dev/stable/3.0.2/dart-convert/dart-convert-library.html) | Dart SDK 3.0.0 |
| 3 | 상태 관리 | [provider](https://pub.dev/packages/provider) | ^6.0.5 |
| 4 | Local Storage (Key-Value) | [shared_preferences](https://pub.dev/packages/shared_preferences) | ^2.1.0 |
| 5 | Local Storage (DB) | [sqflite](https://pub.dev/packages/sqflite) | ^2.2.8+4 |
| 6 | 웹브라우저 호출 | [url_launcher](https://pub.dev/packages/url_launcher) | ^6.1.11 |

결과적으로 저는 Flutter로 프로덕션 수준의 앱을 만드는 데 무리가 없다고 판단했습니다.
물론 **네이티브앱에 비해 구현할 수 있는 기능의 제약은 있겠지만, 사내 모바일 앱을 만들거나 아이디어를 바탕으로 서비스를 시작하는 단계에선 충분하다**고 생각합니다.
다음에는 실제로 플레이스토어와 앱스토어에 배포할 Flutter 앱을 개발해 보려고 합니다.

## Install
```Bash
$ git clone git@github.com:timo-nam/flutter_etude.git
```

## Usage

저는 **VS Code**에 `Dart`, `Flutter` Extension을 설치해 개발하고 주로 내장 디버깅 툴을 통해 앱을 실행해 봅니다.
물론 CLI 환경에서 다음과 같은 명령어로 앱을 실행시킬 수도 있습니다.
```Bash
$ flutter run
```

앱이 정상적으로 작동하는 걸 확인한 플랫폼은 아래 2가지입니다.
- iOS
- AOS

## Demo

### Screenshots

- iOS
  <div>
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/bc6701cb-3491-4cbe-8f66-69d62093610b" width="200" />
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/5531dab5-6efc-4490-a454-d8b9c7c794f4" width="200" />
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/0495f82b-5647-4f8e-a8a3-173eef70f800" width="200" />
  </div>

- AOS
  <div>
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/8ec671b6-a8bf-4da9-b98d-89668826dfb0" width="200" />
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/15d53e2c-f401-4e79-96b5-8ce876ff5edd" width="200" />
    <img src="https://github.com/timo-nam/flutter_etude/assets/76807762/7258ec4e-0009-410d-a198-6224bd0df3df" width="200" />
  </div>

### Videos

- iOS: https://drive.google.com/file/d/1rwu5QGzM7dcKue50UINxVCpHctY3euf3/view?usp=sharing
- AOS: https://drive.google.com/file/d/1CepoXZ3UZj5VNAINjHtb_kTwh7DRmnaQ/view?usp=sharing

## API

Random User Generator [Documentation](https://randomuser.me/documentation)

