# 페이지 내장 객체

[01. JSP 내장 객체의 종류](https://www.notion.so/5744c9723ac8403dbf3dbbfabb7ac06a)

[02. Request 내장 객체를 사용한 로그인 페이지](https://www.notion.so/5744c9723ac8403dbf3dbbfabb7ac06a)

<aside>
💡 **본 실습에 사용된 환경 설정**

- Java 버전 : JDK 8.0.192 / Zulu 8.33.0.1
- IDE : Eclipse Java EE for Web Developers 2018-09
- 서버 : apache tomcat 8.0.32
- DBMS Tool : Toad for Oracle 15.0 Trial
</aside>

## 🟠 JSP 내장 객체의 종류

| 내장 객체 | 반환 타입 (Return Type) | 설명 |
| --- | --- | --- |
| request | javax.servlet.http.HttpServletRequest | 웹 브라우저의 요청 정보를 저장하고 있는 객체 |
| response | javax.servlet.http.HttpServletResponse | 웹 브라우저의 요청에 대한 응답 정보를 저장하고 있는 객체 |
| out | javax.servlet.jsp.jsp.jspWriter | JSP 페이지에 출력할 내용을 가지고 있는 출력 스트림 객체 |
| session | javax.servlet.http.HttpSession | 하나의 웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체 |
| application | javax.servlet.ServletContext | 웹 애플리케이션 Context의 정보를 저장하고 있는 객체 |
| pageContext | javax.servlet.jsp.PageContext | JSP 페이지에 대한 정보를 저장하고 있는 객체 |
| page | java.lang.Object | JSP 페이지를 구현한 자바 클래스 객체 |
| config | javax.servlet.ServletConfig | JSP 페이지에 대한 설정 정보를 저장하고 있는 객체 |
| exception | java.lang.Throwable | JSP 페이지에서 예외가 발생한 경우에 사용되는 객체 |

## 🟠 Request 내장 객체를 사용한 로그인 페이지

![https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_04.png](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_04.png)

> **로그인 정보 입력 페이지 ([RequestLogin.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/Model%201/03.%20Implicit%20object/WebContent/RequestLogin.jsp))**
> 

![https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_01.PNG](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_01.PNG)

```java
<center>
		<h2>로그인 페이지</h2>
		
		<!-- POST 방식으로 데이터를 RequestLoginProc.jsp으로 전송 -->
		<form action="RequestLoginProc.jsp" method="post">
			<table width="400" border="1">
				<tr height="60">
					<td align="center" width="150">아이디</td>
					<td align="center" width="250">
						<input type="text" name="id">
					</td>
				</tr>
				<tr height="60">
					<td align="center" width="150">패스워드</td>
					<td align="center" width="250">
					
						<!-- 패스워드 입력 시 숫자가 보이지 않게끔 하기 위해 type="password" -->
						<input type="password" name="pass">
					</td>
				</tr>
				<tr height="60">
					<td colspan="2" align="center">
					
						<!-- submit 버튼을 누르면 form action 수행 -->
						<input type="submit" value="전송">
					</td>
				</tr>
			</table>
		</form>
	</center>
```

> **로그인 정보 처리 페이지 ([RequestLoginProc.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/Model%201/03.%20Implicit%20object/WebContent/RequestLoginProc.jsp))**
> 

![https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_02.PNG](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_02.PNG)

```java
<body>

	<!-- RequestLogin에서 넘어온 아이디와 패스워드를 읽어들임  -->
	
	<%
	// 사용자 정보가 저장되어 있는 객체 request의 getParameter()를 이용해서 사용자의 정보를 추출
	// getParameter()는 String 자료형으로 값을 return하기 때문에 String 변수로 데이터를 받음
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<h2>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %> 입니다.
	</h2>
	
	<a href="RequestForward.jsp">다음 페이지</a>

</body>
```

> **로그인 정보 처리 페이지 ([RequestForward.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/Model%201/03.%20Implicit%20object/WebContent/RequestForward.jsp))**
> 

![https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_03.PNG](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/03.%20Implicit%20object/JSP_MVC1_03_03.PNG)

```java
<body>

	<!-- RequestLoginProc.jsp에서 넘어온 페이지  -->
	
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<!-- 이전 페이지에서 넘겨준 것이 없기 때문에 아이디와 패스워드가 표시되지 않음 -->
	<!-- request 객체의 범위는 form action을 통해 넘겨준 JSP 파일까지만 해당됨을 알 수 있음 -->
	
	<h2>
	RequestForward 페이지입니다.<br>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %> 입니다.
	</h2>
	
</body>
```