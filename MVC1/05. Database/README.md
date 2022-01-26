# JSP MVC1 데이터베이스
> **본 실습에 사용된 환경 설정**

- Java 버전 : JDK 8.0.192 / Zulu 8.33.0.1
- IDE : Eclipse Java EE for Web Developers 2018-09
- 서버 : apache tomcat 8.0.32
- DBMS Tool : Toad for Oracle 15.0 Trial
<br/>

## 데이터베이스 테이블 생성
&nbsp;본 JSP MVC1 실습에서는 오라클(Oracle) 데이터베이스를 사용해서 공부를 할텐데 오라클만 설치해서는 다루기가 쉽지 않다. 오라클 데이터베이스를 쉽게 사용하기 위한 소프트웨어 툴인 **Toad for Oracle**을 설치한다. 해당 소프트웨어는 유료이므로 Trial 버전을 통해 일정 기간 동안만 무료로 사용한다.
<br/><br/>

> **Toad for Oracle에서 테이블 생성**

![DatabaseImg01](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/MVC1/images/Database/JSP_MVC1_Database_01.JPG)

&nbsp;`[Database]-[Create]-[Table]` 메뉴를 통해 테이블 생성한다. 이후 Editor 화면에서 `SELECT * FROM MEMBER;` 쿼리문을 입력하고 `F9` 버튼이나 Editor 상단 메뉴의 `Execute/Compile Statement`라는 설명이 나오는 버튼을 누르면 생성된 테이블을 확인할 수 있다.
<br/><br/>
## 회원가입 페이지 만들기 ([MemberJoin.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/MVC1/05.%20Database/WebContent/MemberJoin.jsp))
![DatabaseImg02](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/MVC1/images/Database/JSP_MVC1_Database_02.JPG)
<br/><br/>
## Java Bean 페이지 만들기 ([MemberBean.jsp](https://github.com/taechacode/JavaServletPageRepository/blob/main/MVC1/05.%20Database/src/model/MemberBean.java))
![DatabaseImg03](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/MVC1/images/Database/JSP_MVC1_Database_03.JPG)
<br/><br/>
> **Java Bean이란 무엇인가?**

&nbsp;Java Bean은 **데이터를 표현하는 것을 목적으로 하는 Java Class**로, **자바 언어로 작성된 소프트웨어 컴포넌트**이다.  쉽게 이야기하면 **JSP에서 데이터를 담기 위한 표준 규약**이다. 예시로 회원정보 게시판 등의 정보를 출력할 때 필요한 정보들을 Java Bean 객체에 저장했다가 꺼내쓰게 된다.
<br/><br/>
> **왜 Java Bean을 쓰는가?**

&nbsp;JSP의 화면을 보여주는 View 페이지에 Java 코드와 HTML 코드를 함께 작성하면 가독성이 떨어지고 웹 페이지 디자이너의 입장에서 편집하기 까다로울 수 밖에 없다. 그래서 Java 클래스 객체 부분의 코드를 따로 분리하여 작성한다면 **가독성**과 **업무 분담** 측면에서 효율성을 높일 수 있다.
<br/><br/>
> **Java Bean을 쉽게 생성하는 방법**

&nbsp;`Alt + Shift + S` 단축키를 활용하면 일괄적으로 선언된 클래스 변수에 대한 Getter와 Setter를 생성하는 메뉴 `Generate Getters and Setters...`를 확인할 수 있다.
