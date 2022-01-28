# JSP Model 1 기본 개요
[01. JSP/Servlet Model 1](#jspservlet-model-1)<br/>
[02. Hello World 페이지 띄우기 (HelloWorld.jsp)](#hello-world-페이지-띄우기-helloworldjsp)<br/><br/>

> **본 실습에 사용된 환경 설정**

- Java 버전 : JDK 8.0.192 / Zulu 8.33.0.1
- IDE : Eclipse Java EE for Web Developers 2018-09
- 서버 : apache tomcat 8.0.32
- DBMS Tool : Toad for Oracle 15.0 Trial
<br/>

## JSP/Servlet Model 1
&nbsp;웹을 통해서 데이터를 주고 받기 위해 JSP를 사용한다. JSP를 통해 **사용자로부터 데이터를 받고 서버가 그 내용을 처리해서 그 결과를 다시 클라이언트에게 내보내는 일련의 과정**을 **웹 프로그래밍**이라고 한다. 최근에는 개발 시장이 좋아져서 자바스크립트만으로도 Node.js를 사용해 서버를 운영하거나 Express 서버를 이용해 손쉽게 배포를 할 수 있게 되었다.<br/><br/>
&nbsp;하지만 많은 양의 데이터를 처리하거나 RDBMS의 개념을 이용한 오라클 서버를 이용을 하기 위해서는 아직까지는 JSP 웹 프로그래밍을 하는 것이 개발과 운영에 수월할 것이다.<br/><br/>
&nbsp;**Model 1**이라 불리우는 **MVC1 패턴**의 경우 **View와 Controller를 모두 JSP가 담당하는 형태**이다. 즉, JSP 하나로 유저의 요청을 받고 응답을 처리하므로 구현 난이도는 쉽다. 단순하게 우리 회사에 대한 정보, 게시판 등만 만들려면 Model 1 방식을 사용하는 것이 좋다. 하지만 JSP 하나에서 MVC가 모두 이루어지다보니 재사용성도 떨어지고 가독성도 낮다. 만약 좀 더 복잡하고 메인 페이지의 UI를 좀 더 많이 다루어서 리뉴얼이 많이 필요할 경우 재설계(유지보수)를 용이하게 하기 위해 Model 2 방식의 설계를 채택한다.
<br/><br/>

> **Model 1 동작**

![Basic02](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/01.%20Basic%20outline/JSP_MVC1_01_02.png)

1. 브라우저(Browser)를 통해서 웹 페이지에 접속한다.
2. HTTP 서버 통신을 통해서 해당 웹 페이지의 웹 서버에 접속한다. (Request)
3. 웹 페이지에 표시되어야 하는 정보가 데이터베이스에 있다면 데이터베이스 서버에 접속해서 데이터를 받아온 후 JSP 페이지로 조립을 한다. 
4. 조립한 JSP 페이지를 브라우저를 통해 사용자에게 보여준다. (Response)

&nbsp;**고객이 요청한 정보를 전부 JSP가 처리**하면 **Model 1 방식**이다. 그리고 데이터베이스를 통해 가져온 데이터를 JSP가 전부 처리하는 방식도 Model 1 방식이다. 예를 들어, 사용자가 아이디와 패스워드를 입력하고 로그인 버튼을 누르면 해당 로그인 과정을 JSP가 모두 처리하는 것이 Model 1 방식이다.
<br/><br/>
## Hello World 페이지 띄우기 (HelloWorld.jsp)
![Basic01](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/01.%20Basic%20outline/JSP_MVC1_01_01.JPG)
```

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>

Hello World

</body>
</html>

```

