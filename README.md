# 성균관대학교 모바일 학습 플랫폼 프로젝트

## 구현 목표

본 프로젝트는 성균관대학교의 학습자료를 공유하고(기출 제외), 전공 과목에 대한 Q&A를 학생들과 주고받을 수 있게 하며, 이때 보상으로 포인트를 얻어 현금화할 수 있습니다. 또한 스터디나 튜터링을 모집할 수 있는 커뮤니티도 제공합니다. 해당 프로젝트에서는 Flutter를 이용한 프론트엔드 구현만 진행하였고, 모든 기능이 구현된 것은 아니며 구현된 기능은 아래에 기술하였습니다.

## 구현 기능

본 프로젝트는 서버 연동 없이 프론트엔드 구현만 진행하였고, 자료 다운로드 등의 일부 기능에 대한 제한이 있습니다. 또한 UI에 보이는 모든 기능들이 구현된 것은 아니며, 구현된 기능들은 아래와 같습니다.

1. **Login**
    - 아래의 테스트 아이디와 패스워드로 로그인하실 수 있습니다.
        - id: Sophia
        - password: testpassword

2. **Register**
    - 사용자 정보를 입력하여 회원가입할 수 있습니다.

3. **My Page**
    - 유저의 shares, reply, likes 그리고 프로필 사진을 확인할 수 있습니다.
    - My Team
        - 현재 진행중인 스터디나 튜터링 목록을 확인합니다.
    - Point Shop
        - 유저가 갖고 있는 포인트를 확인할 수 있습니다.

4. **Recruiting Page**
    - Tutoring/Mentoring
        - 다른 유저가 게시한 모집 글을 확인할 수 있습니다. (상세 조회는 아직 구현되지 않았습니다.)
    - Create New Team (우측 상단의 ... 버튼으로 접근 가능)
        - 새로운 모집 글을 작성하여 submit 버튼을 클릭하면, recruiting page에서 새로운 모집 글이 사용자 유저의 이름으로 생성된 것을 확인할 수 있습니다.

5. **QnA Page**
    - Detailed QnA Page
        - 게시글을 클릭하여 해당 질문 글의 상세 페이지로 이동할 수 있습니다.
    - Comments
        - 상세 게시글에서 댓글을 달면, 5 포인트를 제공받음과 동시에 댓글이 추가됩니다.
    - Other User's Page
        - 다른 유저의 comments의 프로필 사진을 클릭하면, 해당 유저의 shares, reply, likes 등을 확인할 수 있는 페이지로 이동합니다.

6. **Sharing Page**
    - Detailed Sharing Page
        - 게시글을 클릭하여 해당 자료 게시글의 상세 페이지로 이동할 수 있습니다.
    - Download
        - 해당 게시글의 자료를 다운로드하면 포인트가 소모됩니다.
    - Upload New Document (우측 상단의 ... 버튼으로 접근 가능)
        - 새로운 자료를 공유할 수 있는 페이지로 이동하며, 이때 자료의 유효성 검사를 진행하여 중복된 자료 또는 기출 자료 등으로 적발되면 에러 메시지를 보여줍니다.

## Reference
[1] https://github.com/flutter/flutter "flutter"

## 지원 Operating Systems
| OS       | 지원 여부 |
|----------|-----------|
| Windows  | :o:       |
| Linux    | :o:       |
| MacOS    | :o:       |

## Flutter 설치 방법

#### 1. Install the Flutter SDK for Windows
플러터 설치 방법이 까다로울 수 있습니다. 아래 지침을 잘 따라가 주세요.

(Linux 또는 MacOS의 경우 다음 사이트의 지침을 따라주세요 https://docs.flutter.dev/get-started/install)

1. VS Code를 사용하여 Flutter를 설치합니다.
    - Visual Studio Code 1.77 이상 버전과 VS Code용 Flutter 확장이 설치되어 있는지 확인하십시오.
    - Visual Studio Code 설치는 https://code.visualstudio.com/ 에서 해당 OS에 맞는 installer를 설치한 뒤 1.77 이상 버전을 설치하시면 됩니다.

2. VS Code에서 Flutter를 설치하기
    1. VS Code를 실행합니다.
    2. 명령 팔레트를 열려면 `Control + Shift + P`를 누릅니다.
    3. 명령 팔레트에서 "flutter"를 입력합니다.
    4. "Flutter: New Project"를 선택합니다.
    5. VS Code가 컴퓨터에 Flutter SDK의 위치를 묻습니다.
        - Flutter SDK가 설치되어 있으면 "Locate SDK"를 클릭합니다.
        - Flutter SDK가 설치되어 있지 않으면 "Download SDK"를 클릭합니다. 아래의 "Download the Flutter SDK" 섹션을 참고하십시오.
        - 이 옵션은 개발 도구 필수 조건에 따라 Git for Windows를 설치하지 않은 경우 Flutter 설치 페이지로 이동합니다.
    6. "Which Flutter template?"라는 메시지가 표시되면 무시합니다. `Esc` 키를 누릅니다. 개발 환경을 확인한 후 테스트 프로젝트를 생성할 수 있습니다.

#### 2. Download the Flutter SDK
1. Flutter SDK 폴더 선택 대화 상자가 나타나면 Flutter를 설치할 위치를 선택합니다.
    - VS Code는 기본적으로 사용자 프로필 폴더를 시작 위치로 설정합니다. 다른 위치를 선택하세요.
    - `%USERPROFILE%` 또는 `C:\dev`를 고려해보세요.

    **주의사항**
    다음 조건 중 하나 또는 두 가지를 모두 충족하는 디렉터리 또는 경로에 Flutter를 설치하지 마세요:
    - 경로에 특수 문자나 공백이 포함되어 있는 경우.
    - 경로에 관리자 권한이 필요한 경우.
    - 예를 들어, `C:\Program Files`는 두 조건을 모두 충족하지 않습니다.

2. "Clone Flutter"를 클릭합니다.
    - Flutter를 다운로드하는 동안 VS Code는 다음 팝업 알림을 표시합니다: "Downloading the Flutter SDK. This may take a few minutes."

3. Flutter 다운로드가 완료되면 출력 패널이 표시됩니다.
    ```
    Checking Dart SDK version...
    Downloading Dart SDK from the Flutter engine ...
    Expanding downloaded archive...
    ```

    성공하면 VS Code는 다음 팝업 알림을 표시합니다:
    - "Initializing the Flutter SDK. This may take a few minutes."
    
    초기화하는 동안 출력 패널에는 다음이 표시됩니다:
    ```
    Building flutter tool...
    Running pub upgrade...
    Resolving dependencies...
    Got dependencies.
    Downloading Material fonts...
    Downloading Gradle Wrapper...
    Downloading package sky_engine...
    Downloading flutter_patched_sdk tools...
    Downloading flutter_patched_sdk_product tools...
    Downloading windows-x64 tools...
    Downloading windows-x64/font-subset tools...
    ```

    이 과정에서 `flutter doctor -v`도 실행됩니다. 이 시점에서는 이 출력 내용을 무시하세요. Flutter Doctor는 이 빠른 시작에 적용되지 않는 오류를 표시할 수 있습니다.

4. Flutter 설치가 성공하면 VS Code는 다음 팝업 알림을 표시합니다:
    - "Do you want to add the Flutter SDK to PATH so it's accessible in external terminals?"

5. "Add SDK to PATH"를 클릭합니다.
    - 성공하면 알림이 표시됩니다: "The Flutter SDK was added to your PATH"
    - VS Code는 Google Analytics 알림을 표시할 수 있습니다. 동의하면 "OK"를 클릭하세요.

6. 모든 PowerShell 창에서 Flutter를 활성화하려면:
    - 모든 PowerShell 창을 닫고 다시 엽니다.
    - VS Code를 재시작합니다.

#### 3. Check your development setup

1. Run Flutter doctor
    - `flutter doctor` 명령은 Windows에서 완전한 Flutter 개발 환경의 모든 구성 요소를 검증합니다.
    1. PowerShell을 엽니다.
    2. 모든 구성 요소의 설치를 확인하려면 다음 명령을 실행합니다.
    ```
    PS C:> flutter doctor
    ```
    - 데스크탑 개발을 선택했기 때문에 모든 구성 요소가 필요하지 않습니다. 이 가이드를 따랐다면 명령의 결과는 다음과 비슷할 것입니다.
    ```
    Running flutter doctor...
    Doctor summary (to see all details, run flutter doctor -v):
    [✓] Flutter (Channel stable, 3.22.1, on Microsoft Windows 11 [Version 10.0.22621.3155], locale en)
    [✓] Windows version (Installed version of Windows is version 10 or higher)
    [!] Android toolchain - develop for Android devices
    [!] Chrome - develop for the web
    [✓] Visual Studio - develop Windows apps (version 2022)
    [!] Android Studio (not installed)
    [✓] VS Code (version 1.89)
    [✓] Connected device (1 available)
    [✓] Network resources

    ! Doctor found issues in 3 categories.
    ```

2. Troubleshoot Flutter doctor issues
    - `flutter doctor` 명령이 오류를 반환하는 경우, 이는 Flutter, VS Code, Visual Studio, 연결된 장치 또는 네트워크 리소스와 관련될 수 있습니다.
    - `flutter doctor` 명령이 이러한 구성 요소 중 하나에 대한 오류를 반환하는 경우, 다음 명령을 사용하여 다시 실행합니다.
    ```
    PS C:> flutter doctor -v
    ```
    - 출력 내용을 확인하여 설치해야 할 다른 소프트웨어나 추가 작업을 확인하세요.
    - Flutter SDK 또는 관련 구성 요소의 구성을 변경한 경우, `flutter doctor` 명령을 다시 실행하여 설치를 확인하세요.

## OS별 프로젝트 실행 방법

### Windows

아래 커멘트를 사용해 프로젝트 디렉토리로 이동한 후 실행하세요.
```
cd /frontend
flutter run
```

Windows 사용자가 Chrome과 Edge 브라우저를 설치했다면 아래와 같은 리스트를 확인할 수 있습니다.
```
More than one device connected; please specify a device with the '-d <deviceId>' flag, or use '-d all' to act on all devices.

Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version 10.0.22631.xxxx]
Chrome (web)      • chrome  • web-javascript • Google Chrome 125.0.xxxx.xxx
Edge (web)        • edge    • web-javascript • Microsoft Edge 125.0.xxxx.xx
```

원하는 장치를 선택하여 아래와 같이 실행할 수 있습니다.
```
flutter run -d windows
flutter run -d chrome
flutter run -d edge
```
### Linux
아래 커멘트를 사용해 프로젝트 디렉토리로 이동한 후 실행하세요.
```
cd /frontend
flutter run
```

Linux 사용자가 Chrome 브라우저를 설치했다면 아래와 같은 리스트를 확인할 수 있습니다.
```
More than one device connected; please specify a device with the '-d <deviceId>' flag, or use '-d all' to act on all devices.

Linux (desktop) • linux  • linux-x64      • Ubuntu 20.04.6 LTS 5.15.xxx.x-microsoft-standard-WSL2
Chrome (web)    • chrome • web-javascript • Google Chrome 125.0.xxxx.xxx
```

원하는 장치를 선택하여 아래와 같이 실행할 수 있습니다.
```
flutter run -d linux
flutter run -d chrome
```

### macOS
아래 커멘트를 사용해 프로젝트 디렉토리로 이동한 후 실행하세요.
```
cd /frontend
flutter run
```

macOS 사용자가 Edge 브라우저를 설치했다면 아래와 같은 리스트를 확인할 수 있습니다.
```
More than one device connected; please specify a device with the '-d <deviceId>' flag, or use '-d all' to act on all devices.


macOS (desktop) • macos • darwin-arm64   • macOS 13.3
Edge (web)      • edge  • web-javascript • Microsoft Edge 125.0.xxxx.xx
```

원하는 장치를 선택하여 아래와 같이 실행할 수 있습니다.
```
flutter run -d macos
flutter run -d edge
```

## 실행 예시
### Demo1(Login, My page, Recruiting page)
![demo1](https://github.com/Guho-Kim/2024_OSS_Project/assets/64512313/46773d43-6800-4489-b717-451a9e360c51)

 
#

### Demo2(QnA page, Sharing page)

![demo2](https://github.com/Guho-Kim/2024_OSS_Project/assets/64512313/5e91bd31-9600-4e7e-832b-2710bb27ab54)


## 코드 설명(디렉토리별 설명)
### 프로젝트 구조
```
frontend/
|
├── lib/
|   ├── main.dart
|   └─── src/
|        ├── app.dart
|        ├── pages/
|        |   ├── login/
|        |   |   ├── login_page.dart
|        |   |   └── register_page.dart
|        |   ├── mypage/
|        |   |   └── my_page.dart
|        |   ├── recruiting/
|        |   |   ├── recruiting_page.dart
|        |   |   └── create_team_page.dart
|        |   ├── qna/
|        |   |   ├── qna_page.dart
|        |   |   ├── create_question_page.dart
|        |   |   ├── qna_detail_page.dart
|        |   |   └── other_user_page.dart
|        |   ├── sharing/
|        |   |   ├── sharing_page.dart
|        |   |   ├── create_sharing_page.dart
|        |   |   └── sharing_detail_page.dart
|        ├── controller/
|        |   ├── bottom_nav_controller.dart
|        |   └── user_controller.dart
|        ├── models/
|        |   ├── recruiting_post.dart
|        |   ├── qna_post.dart
|        |   └── sharing_post.dart
|        ├── components/
|        |   ├── myteam_post_widget.dart
|        |   ├── recruiting_post_widget.dart
|        |   ├── qna_post_widget.dart
|        |   ├── sharing_post_widget.dart
|        |   ├── favorite_star_button.dart
|        |   ├── image_data.dart
|        |   └── message_popup.dart
|        └── binding/
|            └── init_bindings.dart

```
### 디렉토리 및 파일 설명
**lib/**
- **main.dart**: 애플리케이션의 진입점 파일입니다.

**src/**
- **app.dart**: 애플리케이션의 주요 설정과 라우팅을 담당합니다.

**src/pages/**
- **login/**
    - **login_page.dart**: 로그인 페이지 화면입니다.
    - **register_page.dart**: 회원가입 페이지 화면입니다.
- **mypage/**
    - **my_page.dart**: 마이 페이지 화면입니다.
- **recruiting/**
    - **recruiting_page.dart**: 팀 모집 페이지 화면입니다.
    - **create_team_page.dart**: 팀 생성 페이지 화면입니다.
- **qna/**
    - **qna_page.dart**: Q&A 메인 페이지 화면입니다.
    - **create_question_page.dart**: 질문 작성 페이지 화면입니다.
    - **qna_detail_page.dart**: Q&A 상세 페이지 화면입니다.
    - **other_user_page.dart**: 다른 사용자 정보 페이지 화면입니다.
- **sharing/**
    - **sharing_page.dart**: 공유 게시판 메인 페이지 화면입니다.
    - **create_sharing_page.dart**: 공유 게시물 작성 페이지 화면입니다.
    - **sharing_detail_page.dart**: 공유 게시물 상세 페이지 화면입니다.

**src/controller/**
- **bottom_nav_controller.dart**: 하단 네비게이션 바의 상태 관리를 담당합니다.
- **user_controller.dart**: 사용자 관련 상태 관리를 담당합니다.

**src/models/**
- **recruiting_post.dart**: 팀 모집 게시물 모델입니다.
- **qna_post.dart**: Q&A 게시물 모델입니다.
- **sharing_post.dart**: 공유 게시물 모델입니다.

**src/components/**
- **myteam_post_widget.dart**: 팀 게시물 위젯입니다.
- **recruiting_post_widget.dart**: 팀 모집 게시물 위젯입니다.
- **qna_post_widget.dart**: Q&A 게시물 위젯입니다.
- **sharing_post_widget.dart**: 공유 게시물 위젯입니다.
- **favorite_star_button.dart**: 즐겨찾기 버튼 위젯입니다.
- **image_data.dart**: 이미지 데이터 위젯입니다.
- **message_popup.dart**: 메시지 팝업 위젯입니다.

**src/binding/**
- **init_bindings.dart**: 초기 바인딩 설정을 담당합니다.
