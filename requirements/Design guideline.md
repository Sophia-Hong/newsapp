# Your News - Flutter Design Guidelines

## 1. 색상 시스템

### ThemeData Configuration
```dart
final lightTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: Color(0xFF1A1A1A),
    secondary: Color(0xFF4A4A4A),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1A1A1A),
    onBackground: Color(0xFF1A1A1A),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: Color(0xFFFF4081),
    secondary: Color(0xFF4A4A4A),
    surface: Color(0xFF121212),
    background: Color(0xFF121212),
    error: Color(0xFFCF6679),
    onPrimary: Color(0xFF000000),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onError: Color(0xFF000000),
    brightness: Brightness.dark,
  ),
);
```

### 그라데이션
```dart
final cardGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF1A1A1A),
    Color(0xFF2A2A2A),
  ],
);
```

## 2. 타이포그래피

### TextTheme Configuration
```dart
final textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'NewYork',
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'NewYork',
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'SFPro',
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'SFPro',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
);
```

## 3. 컴포넌트 스타일

### 카드 스타일
```dart
final cardDecoration = BoxDecoration(
  gradient: cardGradient,
  borderRadius: BorderRadius.circular(12),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ],
);
```

### 버튼 스타일
```dart
final primaryButton = ElevatedButton.styleFrom(
  elevation: 0,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
```

### 입력 필드 스타일
```dart
final inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.grey[900],
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
);
```

## 4. 여백 시스템

### EdgeInsets Constants
```dart
class Spacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}
```

## 5. 애니메이션

### Duration Constants
```dart
class AnimationDuration {
  static const quick = Duration(milliseconds: 200);
  static const normal = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 500);
}
```

### Curves
```dart
final standardEasing = Curves.easeInOutCubic;
final emphasizedEasing = Curves.easeOutCubic;
```

## 6. 반응형 디자인

### Breakpoints
```dart
class Breakpoints {
  static const double mobile = 0;
  static const double tablet = 600;
  static const double desktop = 900;
}
```

### ResponsiveBuilder
```dart
Widget buildResponsive(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth >= Breakpoints.desktop) {
        return DesktopLayout();
      } else if (constraints.maxWidth >= Breakpoints.tablet) {
        return TabletLayout();
      }
      return MobileLayout();
    },
  );
}
```

## 7. 접근성

### Semantic Labels
```dart
// 이미지 접근성
Image.network(
  url,
  semanticLabel: '뉴스 썸네일 이미지',
);

// 버튼 접근성
IconButton(
  tooltip: '공유하기',
  // ...
);
```

## 8. 아이콘 시스템

### IconTheme Configuration
```dart
final iconTheme = IconThemeData(
  size: 24,
  color: Color(0xFFFF4081),
);
```

## 9. 이미지 처리

### Image Constants
```dart
class ImageSize {
  static const double thumbnail = 80;
  static const double preview = 150;
  static const double full = 300;
}
```

## 10. 그림자 시스템

### BoxShadow Styles
```dart
class Shadows {
  static final List<BoxShadow> small = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  
  static final List<BoxShadow> medium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];
}
```

## 11. 상태 표시

### Loading States
```dart
final loadingIndicator = CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF4081)),
  strokeWidth: 2,
);
```

### Error States
```dart
final errorStyle = TextStyle(
  color: Color(0xFFB00020),
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
```