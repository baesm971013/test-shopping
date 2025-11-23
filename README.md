# TETO SHOP 프로젝트

## 프로젝트 개요

테토샵: AWS Gen AI 4조 테스트사이트

## 기술 스택

- **Frontend**: Vue.js + Vuetify (또는 Quasar)
- **Backend**: Java + Spring Boot
- **Database**: AWS DynamoDB
- **File Storage**: AWS S3 + CloudFront
- **Authentication**: JWT 토큰
- **Version Control**: GitHub

## 주요 기능

1. 쇼핑몰 메인페이지 (상품리스트 조회)
2. 회원가입/로그인
3. 마이페이지
4. 관리자 페이지 (상품등록, 매출관리)
5. 주문 내역 조회
6. 장바구니
7. 무통장입금 결제

## 프로젝트 구조

```
AWS_Gen_AI_Mall/
├── frontend/                    # Vue.js 프론트엔드
│   ├── src/
│   │   ├── components/         # 재사용 컴포넌트
│   │   ├── views/             # 페이지 컴포넌트
│   │   ├── router/            # 라우팅 설정
│   │   ├── store/             # Vuex 상태관리
│   │   └── services/          # API 호출 서비스
│   ├── public/
│   └── package.json
├── backend/                     # Spring Boot 백엔드
│   ├── src/main/java/
│   │   ├── controller/        # REST API 컨트롤러
│   │   ├── service/           # 비즈니스 로직
│   │   ├── repository/        # 데이터 액세스
│   │   ├── model/             # 엔티티 모델
│   │   ├── config/            # 설정 클래스
│   │   └── security/          # JWT 보안 설정
│   ├── src/main/resources/
│   └── pom.xml
├── docs/                        # 프로젝트 문서
│   ├── api-spec.md            # API 명세서
│   ├── database-schema.md     # DB 스키마
│   └── deployment.md          # 배포 가이드
└── README.md
```

## 개발 환경 요구사항

- Node.js 18+
- Java 17+
- Gradle 8.5+
- AWS CLI
- AWS 계정 (DynamoDB, S3 권한 필요)
- Git

## 설치 및 실행

### Backend 실행

```bash
cd backend
.\gradlew build
.\gradlew bootRun
```

### Frontend 실행

```bash
cd frontend
npm install
npm run serve
```

## API 엔드포인트

### 인증

- `POST /api/auth/register` - 회원가입
- `POST /api/auth/login` - 로그인
- `POST /api/auth/refresh` - 토큰 갱신

### 상품

- `GET /api/products` - 상품 목록 조회
- `GET /api/products/{id}` - 상품 상세 조회
- `POST /api/products` - 상품 등록 (관리자)
- `PUT /api/products/{id}` - 상품 수정 (관리자)
- `DELETE /api/products/{id}` - 상품 삭제 (관리자)

### 주문

- `GET /api/orders` - 주문 내역 조회
- `POST /api/orders` - 주문 생성
- `GET /api/orders/{id}` - 주문 상세 조회

### 장바구니

- `GET /api/cart` - 장바구니 조회
- `POST /api/cart/items` - 장바구니 아이템 추가
- `PUT /api/cart/items/{id}` - 장바구니 아이템 수정
- `DELETE /api/cart/items/{id}` - 장바구니 아이템 삭제

## 데이터베이스 스키마 (DynamoDB)

### Users 테이블

- PK: userId (String)
- email (String)
- password (String, 암호화)
- name (String)
- role (String: USER, ADMIN)
- createdAt (String)

### Products 테이블

- PK: productId (String)
- name (String)
- description (String)
- price (Number)
- category (String)
- imageUrl (String)
- stock (Number)
- createdAt (String)

### Orders 테이블

- PK: orderId (String)
- userId (String)
- items (List)
- totalAmount (Number)
- status (String: PENDING, PAID, SHIPPED, DELIVERED)
- createdAt (String)

### Cart 테이블

- PK: userId (String)
- SK: productId (String)
- quantity (Number)
- addedAt (String)

## 환경 변수 설정

### Backend (application.yml)

```yaml
aws:
  region: ap-northeast-2
  dynamodb:
    endpoint: # 로컬 개발시에만
  s3:
    bucket: your-bucket-name
    cloudfront-domain: your-cloudfront-domain

jwt:
  secret: your-jwt-secret
  expiration: 86400000
```

### Frontend (.env)

```
VUE_APP_API_BASE_URL=http://localhost:8080/api
VUE_APP_S3_BASE_URL=https://your-cloudfront-domain
```
# test-shopping
# test-shopping
