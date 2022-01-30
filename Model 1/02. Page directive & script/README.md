# JSP Model 1 페이지 디렉티브와 스크립트 요소
[01. 페이지 디렉티브와 종류](#페이지-디렉티브와-종류)<br/>
[02. 페이지 스크립트](#페이지-스크립트)<br/><br/>

> **본 실습에 사용된 환경 설정**

- Java 버전 : JDK 8.0.192 / Zulu 8.33.0.1
- IDE : Eclipse Java EE for Web Developers 2018-09
- 서버 : apache tomcat 8.0.32
- DBMS Tool : Toad for Oracle 15.0 Trial
<br/>

## 페이지 디렉티브와 종류
&nbsp;**페이지 디렉티브(Page directive)** 는 JSP 페이지에 속성을 부여하기 위해 보통 JSP 상단에 표시하는 문구이다. 또는 JSP 페이지를 구성하는 요소를 나타내기 위해 표기하기도 한다. 종류는 아래와 같다.<br/>
<br/>
> **페이지 디렉티브의 종류**

|<center>속성</center>|<center>설명</center>|<center>기본값</center>|
|:---:|:---|:---:|
|language|&nbsp;JSP 스크립트 코드에서 사용되는 프로그래밍 언어를 지정한다. JSP 2.1버전까지는 스크립트 언어로서 자바만을 지원하고 있다.|java|
|contentType|&nbsp;JSP가 생성할 문서의 타입을 지정한다.|text/html|
|import|&nbsp;JSP 페이지에서 사용할 자바 클래스를 지정한다.||
|session|&nbsp;JSP 페이지가 세션을 사용할 지의 여부를 지정한다. "true"일 경우 세션을 사용하고 "false"일 경우 세션을 사용하지 않는다.|true|
|buffer|&nbsp;JSP 페이지의 출력 버퍼 크기를 지정한다. "none"일 경우 출력 버퍼를 사용하지 않으며, "8kb"라고 입력할 경우 8kb 크기의 출력 버퍼를 사용한다.|최소 8kb|
|autoFlush|&nbsp;출력 버퍼가 다 찼을 경우 자동으로 버퍼에 있는 데이터를 출력 스트림으로 보내고 비울 지의 여부를 나타낸다. "true"일 경우 버퍼의 내용을 웹 브라우저에 보낸 후 버퍼를 비우며, "false"일 경우 에러를 발생시킨다.|true|
|info|&nbsp;JSP 페이지에 대한 설명을 입력한다.||
|errorPage|&nbsp;JSP 페이지를 실행하는 도중 에러가 발생할 때 보여줄 페이지를 지정한다.||
|isErrorPage|&nbsp;현재 페이지가 에러가 발생될 때 보여지는 페이지인지의 여부를 지정한다. "true"일 경우 에러페이지이며, "false"일 경우 에러 페이지가 아니다.|false|
|PageEncoding|&nbsp;JSP 페이지 자체의 캐릭터 인코딩을 지정한다.||
|isELIgnored (2.0)|&nbsp;"true"일 경우 표현 언어를 지원하며, "false"일 경우 표현 언어를 지원하지 않는다. 기본값은 web.xml 파일이 사용하는 JSP 버전 및 설정에 따라 다르다.||
|deferredSyntaxAllowedAsLiteral (2.1)|&nbsp;'#', '{' 문자가 문자열 값으로 사용되는 것을 허용할 지의 여부를 지정한다.|false|
|trimDirectiveWhitespaces (2.1)|&nbsp;출력 결과에서 템플릿 텍스트의 공백 문자를 제거할 지의 여부를 지정한다.|false|
<br/>

![JSP_MVC1_02_01](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_01.JPG)

&nbsp;JSP 페이지를 생성하면 볼 수 있는 가장 상단에 **<%@ %>** 로 표기된 부분이 바로 페이지 디렉티브이다. 기본적으로 정의된 페이지 디렉티브를 해석해보자. 첫번째 **language="java"** 는 페이지 스크립트 내 요소를 Java 언어로 쓰겠다는 의미이고, 두번째 **contentType="text/html; charset=EUC-KR"** 는 해당 JSP 파일을 html로 바꿀 것이며 안에 사용하는 문자열은 EUC-KR이라는 의미이고, 세번째 **pageEncoding="EUC-KR"** 은 JSP 페이지가 앞의 문자열과 마찬가지로 EUC-KR 형태의 한국어로 사용되어진다는 의미이다.
<br/><br/>
>**페이지 디렉티브를 이용한 에러 페이지 이동 ([PageDirective.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/Model%201/02.%20Page%20directive%20%26%20script/WebContent/PageDirective.jsp), [Error.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/Model%201/02.%20Page%20directive%20%26%20script/WebContent/Error.jsp))**

![JSP_MVC1_02_02](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_02.JPG)
![JSP_MVC1_02_03](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_03.JPG)
![JSP_MVC1_02_04](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_04.JPG)
<br/><br/>

## 페이지 스크립트
<br/>

> **스크립트 릿 <% %>**

&nbsp;**스크립트 릿**은 JSP 페이지에서 많이 쓰이는 스크립트 요소로 **프로그래밍 로직을 기술**할 때 많이 쓰인다. 스크립트 릿에서 선언한 변수는 JSP 페이지가 서블릿으로 변환될 때 지역변수로 사용된다.
```
<%
	Java 코드
%>
```
<br/>

> **선언문 <%! %>**

&nbsp;선언문은 JSP 페이지에서 **자바의 멤버변수(전역, Global의 개념) 또는 멤버 메소드로 사용**하고자 할 때 기술한다. 선언문의 변수는 서블릿으로 변환될 때 멤버변수로 변환되고 선언문에서의 메소드는 서블릿에서 메소드로 만들어진다. 하지만 실제로 쓸만한 상황은 많이 안 나온다고 한다.

```
<%!
	Java 코드
%>
```
<br/>

> **표현식 <%= %>**

&nbsp;표현식은 JSP 페이지에서 자바의 System.out.println()과 유사하게 사용된다. **데이터를 출력**할 때 주로 사용한다.

```
<%=
	Java 코드
%>
```
<br/>

> **스크립트 릿과 표현식을 활용한 구구단 출력**

![JSP_MVC1_02_05](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_05.jpg)

```
<body>
<h2>화면에 구구단을 출력하시오.</h2>
<%
for(int i = 2; i < 10; i++) {
	for(int j = 1; j < 10; j++) {
%>

<%= i %> * <%= j %> = <%= i * j %> &nbsp;&nbsp;
		
<%
	}
%>

<br>

<%
}
%>
</body>
```
<br/>

> **out 기본 객체(내장 객체)를 활용한 구구단 출력**

&nbsp;스크립트 릿을 사용하면 화면에 출력할 부분만 따로 <%= %> 처리해주는 것이 너무 힘들 수 있다. 그래서 톰캣과 같은 JSP/서블릿 컨테이너가 기본적으로 제공하는 출력용 객체가 있다. 바로 "out"이라는 것인데 기본 객체는 클래스의 인스턴스 형태로 스크립트 릿에서 참조 변수를 사용하는 것과 동일하게 사용할 수 있다.

![JSP_MVC1_02_06](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/Model%201/images/02.%20Page%20directive%20%26%20script/JSP_MVC1_02_06.jpg)
```
<body>
<h2>화면에 구구단을 출력하시오.</h2>
<%
for(int i = 2; i < 10; i++) {
	for(int j = 1; j < 10; j++) {
		out.write(i + " * " + j + " = " + i * j + "&nbsp;" + "&nbsp;");
	}
	out.write("<br>");
}
%>
</body>
```
