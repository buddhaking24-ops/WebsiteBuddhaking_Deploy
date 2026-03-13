# ============================
# 1. Chọn base image chính thức của OpenJDK
# ============================
FROM docker.io/eclipse-temurin:21-jdk AS build

# ============================
# 2. Thiết lập thư mục làm việc trong container
# ============================
WORKDIR /app

# ============================
# 3. Copy file JAR từ máy host vào container
#    Giả sử bạn đã build JAR nằm ở target/WebsiteBuddhaking-0.0.1-SNAPSHOT.jar
# ============================
COPY WebsiteBuddhaking-0.0.1-SNAPSHOT.jar app.jar

# ============================
# 4. Expose port mà Spring Boot chạy (mặc định 8080)
# ============================
EXPOSE 8080

# ============================
# 5. Lệnh chạy ứng dụng khi container start
# ============================
ENTRYPOINT ["java","-jar","app.jar"]

