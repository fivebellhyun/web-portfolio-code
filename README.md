# fivebellhyun — 웹 포트폴리오

Flutter Web(WebAssembly)으로 만든 개인 포트폴리오 사이트입니다.

**[https://fivebellhyun.web.app](https://fivebellhyun.web.app)**

```
Flutter 3.29+ · Dart 3.4+ · dart2wasm (skwasm) · Firebase Hosting
```


## 프로젝트 구조

```
lib/
├─ main.dart                     MaterialApp, 첫 프레임 이후 이미지 워밍업
├─ app_bootstrapper.dart         방향 고정, 첫 프레임 후 flutter-ready 신호
├─ components/
│  ├─ drawer.dart                사이드 드로어, 스킬 게이지
│  ├─ app_images.dart            Firebase Storage 이미지 URL
│  └─ app_svgs.dart
├─ helper/
│  ├─ constants/                 색상, 테마
│  └─ extensions/responsive.dart 브레이크포인트
├─ screen/
│  ├─ welcome_page.dart          인트로 + 가로 캐러셀
│  ├─ web/     d_page0~4, d_lastpage
│  └─ mobile/  m_page0~4, m_lastpage
└─ widget/                       유성 페인터, 아이콘 버튼

assets/
├─ subset_fonts.py               기존 폰트에서 사용하지 않는 문자들 제거(용량 축소 목적)
└─ fonts/
    └─notosans.ttf

web/
├─ index.html                    로딩 화면 + 정적 SEO 콘텐츠 + 리소스 힌트
├─ about.html                    Flutter 없는 정적 전체 경력 페이지
├─ flutter_bootstrap.js          hostElement 지정 커스텀 부트스트랩
├─ style.css                     레이어 구조, 로딩 화면
└─ sitemap.xml · robots.txt · manifest.json

tool/
├─ subset_font.py                폰트 서브셋 생성
└─ check_budget.sh               배포 후 전송 예산 확인
```

---

## 실행

```bash
flutter pub get
flutter run -d chrome
```

## 빌드 및 배포

```bash
python3 tool/subset_font.py          # 폰트를 교체했을 때만
flutter clean
flutter build web --release --wasm
firebase deploy --only hosting
```

## 사용 패키지

`cached_network_image` · `carousel_slider` · `animated_text_kit` · `flutter_svg` · `url_launcher`

---

## Contact

오종현 (Jonghyun Oh · five bell hyun)

- [taoss3932@gmail.com](mailto:taoss3932@gmail.com)
- [LinkedIn](https://www.linkedin.com/in/fivebellhyun)
- [네이버 블로그](https://m.blog.naver.com/fivebellhyun)
- [카카오톡 오픈채팅](https://open.kakao.com/o/sOQutMId)