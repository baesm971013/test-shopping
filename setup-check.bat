@echo off
echo ========================================
echo TETO SHOP 개발 환경 확인
echo ========================================

echo.
echo [Java 버전 확인]
java -version
echo.

echo [Gradle 버전 확인]
gradle -version
echo.

echo [Node.js 버전 확인]
node -v
echo.

echo [npm 버전 확인]
npm -v
echo.

echo [AWS CLI 버전 확인]
aws --version
echo.

echo ========================================
echo 개발 환경 확인 완료
echo ========================================
pause