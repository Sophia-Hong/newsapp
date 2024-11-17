# Your News - Product Requirements Document
## 개요
'Your News'는 영화와 문화 콘텐츠에 특화된 개인화 뉴스 애플리케이션입니다. 사용자는 관심 있는 뉴스를 읽고, 날씨를 확인하며, 투자 종목을 모니터링할 수 있습니다.

## 기술 스택
- Frontend Only MVP
- 더미 데이터 활용
- Unsplash API 이미지 통합

## 상세 요구사항

### 1. 홈 화면
#### 1.1 상단 네비게이션
- 로고 및 서비스명 "Your News"
  - 폰트: New York Times 스타일 세리프체
  - 좌측 정렬
  - 최소 높이: 56px

#### 1.2 검색 기능
- 검색창 디자인
  - 둥근 모서리 (border-radius: 8px)
  - 플레이스홀더: "영화, 문화 뉴스를 검색해보세요"
- 검색 결과 페이지
  - 실시간 검색어 추천
  - 카테고리별 필터링 옵션

#### 1.3 메인 뉴스 섹션
- 카드 스와이프 형식
- 각 카드 구성:
  - 대형 이미지 (16:9 비율)
  - 헤드라인 (24px)
  - 서브헤드라인 (16px)
  - 읽기 예상 시간
- 스와이프 인디케이터

#### 1.4 날씨 위젯
- 위치: Temecula
- 표시 정보:
  - 현재 온도
  - 체감 온도
  - 날씨 아이콘
  - 습도
  - 강수 확률

#### 1.5 주식 정보
- 스크롤 가능한 카드 형태
- 각 종목 표시:
  - 종목명
  - 현재가
  - 등락률
  - 간단 차트

#### 1.6 히스토리 섹션
- "오늘의 문화사"
- 타임라인 형식 레이아웃
- 각 이벤트:
  - 연도
  - 이벤트 제목
  - 간단 설명
  - 관련 이미지

#### 1.7 하단 네비게이션
- 3개 탭:
  - 뉴스 (홈)
  - 날씨
  - My

### 2. 개별 뉴스 화면
- 헤더:
  - 뒤로가기 버튼
  - 공유 버튼
  - 스크랩 버튼
- 콘텐츠:
  - 대형 헤더 이미지
  - 제목 (28px)
  - 작성일
  - 작성자
  - 본문 (18px)
- 하단:
  - 관련 기사 추천
  - 태그 클라우드

### 3. 뉴스 탭
#### 카테고리별 레이아웃
- 영화
  - 16:9 대형 이미지
  - 개봉일 정보
  - 평점
- 문학
  - 1:1.4 책 커버 이미지
  - 작가 정보
  - 출간일
- 여행
  - 16:10 풍경 이미지
  - 위치 정보
  - 계절별 추천

### 4. 날씨 탭
#### 4.1 현재 날씨
- 대형 온도 표시
- 상세 기상 정보
- 실시간 업데이트 시간

#### 4.2 주간 날씨
- 7일 예보
- 일별 온도 변화 그래프
- 강수 확률 표시

#### 4.3 라이프스타일 추천
- 오늘의 옷차림
- UV 지수 기반 외출 팁
- 실내/외 활동 추천

### 5. My 탭
#### 5.1 사용자 설정
- 다크모드 토글
- 알림 설정
  - 뉴스 알림
  - 날씨 알림
  - 주식 알림
- 글자 크기 조절
- 언어 설정

#### 5.2 콘텐츠 설정
- 관심 카테고리 설정
- 뉴스 구독 관리
- 위치 설정
- 주식 관심종목 관리

### 6. To-do Section
#### 6.1 Overview
- Integration with Google Calendar API (future implementation)
- Simple and elegant task management
- Focus on daily tasks and reminders

#### 6.2 Features
- Task list with completion status
- Priority indicators (subtle visual cues)
- Time-based categorization (Today, Upcoming)
- Quick add functionality
- Swipe actions for complete/delete

#### 6.3 UI Components
- Clean, minimal task cards
- Checkbox with subtle animation
- Task title with optional time
- Priority indicator (left border or subtle icon)
- Progress indicator for daily tasks

#### 6.4 Interactions
- Swipe right to complete
- Swipe left to delete
- Tap to edit (future implementation)
- Long press for additional options

#### 6.5 Future Integration Points
- Google Calendar API sync
- Recurring tasks
- Task categories/labels
- Reminders and notifications
- Task sharing

#### 6.6 Data Structure
```dart
class Task {
  String id;
  String title;
  DateTime? dueDate;
  bool isCompleted;
  TaskPriority priority;
  String? note;
  String? calendarEventId;  // For future Google Calendar sync
}

enum TaskPriority {
  low,
  medium,
  high
}
```

#### 6.7 Design Guidelines
- Consistent with app's warm color palette
- Subtle priority indicators
- Clean typography
- Proper spacing between tasks
- Smooth animations for interactions

## 디자인 가이드라인
### 색상
- Primary: #1A1A1A
- Secondary: #4A4A4A
- Accent: #FF4081
- Background: #FFFFFF
- Dark mode background: #121212

### 타이포그래피
- 헤딩: NewYork (iOS), Noto Serif (Android)
- 본문: SF Pro Text (iOS), Roboto (Android)

### 여백
- 기본 패딩: 16px
- 섹션 간격: 24px
- 카드 간격: 12px

### 애니메이션
- 카드 스와이프: ease-out, 300ms
- 탭 전환: ease-in-out, 200ms
- 버튼 피드백: ease, 100ms

## 구현 진행 현황 및 체크포인트

### Phase 1: 기반 구축
- [x] 프로젝트 초기 설정
- [x] 테마 시스템 구현
- [x] 기본 위젯 구현
- [x] 네비게이션 시스템

### Phase 2: 핵심 기능
- [x] 홈 화면 레이아웃
- [x] 뉴스 카드 스와이퍼
- [ ] 날씨 위젯
- [ ] 주식 정보 위젯

### Phase 3: 뉴스 기능
- [ ] 상세 뉴스 화면
- [ ] 카테고리별 보기
- [ ] 검색 기능
- [ ] 히스토리 타임라인

### Phase 4: 부가 기능
- [ ] 날씨 상세 화면
- [ ] 프로필 설정
- [ ] 다크모드
- [ ] 다국어 지원

### 품질 관리 체크포인트
- [x] 기본 성능 최적화 (이미지 캐싱, 메모리 관리)
- [ ] 접근성 검증
- [ ] 반응형 레이아웃 검증
- [ ] 사용성 테스트

### 현재 ���현된 기능
1. 기본 프로젝트 구조
2. 테마 시스템 (라이트/다크 모드)
3. 네비게이션 시스템
4. 뉴스 카드 스와이퍼
   - 16:9 이미지 비율
   - 북마크 기능 UI
   - 공유 기능 UI
   - 읽기 시간 표시
   - 페이지 인디케이터