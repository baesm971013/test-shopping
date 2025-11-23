@echo off
echo ========================================
echo TETO SHOP 로컬 DynamoDB 설정
echo ========================================

echo.
echo [로컬 DynamoDB 테이블 생성 중...]

REM Users 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-users ^
    --attribute-definitions AttributeName=userId,AttributeType=S ^
    --key-schema AttributeName=userId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --endpoint-url http://localhost:8000

REM Products 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-products ^
    --attribute-definitions AttributeName=productId,AttributeType=S ^
    --key-schema AttributeName=productId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --endpoint-url http://localhost:8000

REM Orders 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-orders ^
    --attribute-definitions AttributeName=orderId,AttributeType=S ^
    --key-schema AttributeName=orderId,KeyType=HASH ^
    --billing-mode PAY_PER_REQUEST ^
    --endpoint-url http://localhost:8000

REM Cart 테이블 생성
aws dynamodb create-table ^
    --table-name teto-shop-cart ^
    --attribute-definitions AttributeName=userId,AttributeType=S AttributeName=productId,AttributeType=S ^
    --key-schema AttributeName=userId,KeyType=HASH AttributeName=productId,KeyType=RANGE ^
    --billing-mode PAY_PER_REQUEST ^
    --endpoint-url http://localhost:8000

echo.
echo ========================================
echo 로컬 DynamoDB 테이블 생성 완료!
echo ========================================
pause