# Authman

## Introduction
A general permission management system developed using Spring Boot.

## Software Architecture
Software architecture description

> Backend Framework: Spring Boot 2.0, MyBatisPlus

> Permission: Shiro, Ehcache

> Frontend: Layui, Thymeleaf

> Database: MySQL5.7

## Installation Guide

1. Clone the code and open it as a Maven project in IntelliJ IDEA
2. Create a database
  - Create database: authman  Encoding: UTF-8
  - Execute SQL statement (authman.sql)
3. Modify the database password in application.yml
4. Start the project: `docker-compose up -d`
5. Access the system: localhost:8081/authman, username: admin password: 123

## Features
1. Department management
2. Permission management
3. Role management
4. User management
5. Log management
6. System login and logout
7. Password modification
