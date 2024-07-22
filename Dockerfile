# Node.js 20 이미지 사용
FROM node:20

# 작업 디렉토리 설정
WORKDIR /app

# 패키지 매니저 파일 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 애플리케이션 소스 코드 복사
COPY . .

# 애플리케이션 빌드
RUN npm run build

# serve 설치
RUN npm install -g serve

# 포트 5000을 외부에 공개
EXPOSE 5000

# serve를 사용해 빌드된 애플리케이션 제공 (dist 디렉토리 사용)
CMD ["serve", "-s", "dist", "-l", "5000"]
