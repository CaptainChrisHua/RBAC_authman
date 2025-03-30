# 使用 Liberica OpenJDK 11 作为构建环境
FROM bellsoft/liberica-openjdk-debian:11 AS build

# 设置工作目录
WORKDIR /app

# 复制 Maven 配置文件和源码
COPY pom.xml .
COPY src ./src

# 更新并安装 Maven
RUN apt-get update && apt-get install -y maven \
    && mvn clean package -DskipTests

# 选择一个适合生产环境的 JRE 运行时
FROM openjdk:11-jre-slim

# 安装字体，避免 X11FontManager 相关错误
RUN apt-get update && apt-get install -y fonts-dejavu fontconfig

# 设置工作目录
WORKDIR /app

# 复制构建好的 JAR 文件
COPY --from=build /app/target/*.jar app.jar

# 指定暴露的端口
EXPOSE 8081

# 运行应用
CMD ["java", "-Djava.awt.headless=true", "-Dsun.java2d.noddraw=true", "-jar", "app.jar"]
