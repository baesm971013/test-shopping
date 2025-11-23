@echo off
echo ========================================
echo TETO SHOP AWS 리소스 생성
echo ========================================

echo.
echo [DynamoDB 테이블 생성 중...]

REM Users 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-users ^
    --attribute-definitions AttributeName=userId,AttributeType=S ^
    --key-schema AttributeName=userId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --region ap-northeast-2

REM Products 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-products ^
    --attribute-definitions AttributeName=productId,AttributeType=S ^
    --key-schema AttributeName=productId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --region ap-northeast-2

REM Orders 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-orders ^
    --attribute-definitions AttributeName=orderId,AttributeType=S ^
    --key-schema AttributeName=orderId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --region ap-northeast-2

REM Cart 테이블 생성 (복합 키)
aws dynamodb create-table ^
    --table-name teto-shop-cart ^
    --attribute-definitions AttributeName=userId,AttributeType=S AttributeName=productId,AttributeType=S ^
    --key-schema AttributeName=userId,KeyType=HASH AttributeName=productId,KeyType=RANGE ^
    --billing-mode PAY_PER_REQUEST ^
    --region ap-northeast-2

echo.
echo [S3 버킷 생성 중...]
aws s3 mb s3://teto-shop-images --region ap-northeast-2

echo.
echo ========================================
echo AWS 리소스 생성 완료!
echo ========================================
pause