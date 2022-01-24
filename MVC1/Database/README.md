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
## 회원가입 페이지 만들기 (MemberJoin.jsp)
![DatabaseImg02](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/MVC1/images/Database/JSP_MVC1_Database_02.JPG)
```

    <body>
    
    	<center>
    	<h2>회원 가입</h2>
    	<form action="MemberJoinProc.jsp" method="post">
    		<table width="500" border="1">
    			<tr height="50">
    				<td width="150" align="center">아이디</td>
    				<td width="350" align="center">
    					<input type="text" name="id" size="40" placeholder="id 넣으세요">
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">패스워드</td>
    				<td width="350" align="center">
    					<input type="password" name="pass1" size="40" placeholder="비밀번호는 영문과 숫자만 넣어주세요.">
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">패스워드확인</td>
    				<td width="350" align="center">
    					<input type="password" name="pass2" size="40">
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">이메일</td>
    				<td width="350" align="center">
    					<input type="email" name="email" size="40">
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">전화번호</td>
    				<td width="350" align="center">
    					<input type="tel" name="tel" size="40">
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">당신의 관심분야</td>
    				<td width="350" align="center">
    					<input type="checkbox" name="hobby" value="캠핑">캠핑&nbsp;&nbsp;
    					<input type="checkbox" name="hobby" value="등산">등산&nbsp;&nbsp;
    					<input type="checkbox" name="hobby" value="영화">영화&nbsp;&nbsp;
    					<input type="checkbox" name="hobby" value="독서">독서&nbsp;&nbsp;
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">당신의 직업은?</td>
    				<td width="350" align="center">
    					<select name="job">
    						<option value="교사">교사</option>
    						<option value="변호사">변호사</option>
    						<option value="의사">의사</option>
    						<option value="기술사">기술사</option>
    					</select>
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">당신의 연령은</td>
    				<td width="350" align="center">
    					<input type="radio" name="age" value="10">10대&nbsp;&nbsp;
    					<input type="radio" name="age" value="20">20대&nbsp;&nbsp;
    					<input type="radio" name="age" value="30">30대&nbsp;&nbsp;
    					<input type="radio" name="age" value="40">40대&nbsp;&nbsp;
    				</td>
    			</tr>
    			<tr height="50">
    				<td width="150" align="center">하고싶은말</td>
    				<td width="350" align="center">
    					<textarea rows="5" cols="40" name="info"></textarea>
    				</td>
    			</tr>
    			<tr height="50">
    				<td align="center" colspan="2">
    					<input type="submit" value="회원 가입">
    					<input type="reset" value="취소">
    				</td>
    			</tr>
    		</table>
    	</form>
    	</center>
    	
    </body>

```
## Java Bean 페이지 만들기 (MemberBean.jsp)
![DatabaseImg03](https://raw.githubusercontent.com/taechacode/JavaServletPageRepository/main/MVC1/images/Database/JSP_MVC1_Database_03.JPG)

```

package model;

public class MemberBean {
	private String id;
	private String pass1;
	private String pass2;
	private String email;
	private String tel;
	private String hobby;
	private String job;
	private String age;
	private String info;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getPass2() {
		return pass2;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}

```
> **Java Bean이란 무엇인가?**

&nbsp;Java Bean은 데이터를 표현하는 것을 목적으로 하는 Java Class로, 자바 언어로 작성된 소프트웨어 컴포넌트이다.  쉽게 이야기하면 JSP에서 데이터를 담기 위한 표준 규약이다. 예시로 회원정보 게시판 등의 정보를 출력할 때 필요한 정보들을 Java Bean 객체에 저장했다가 꺼내쓰게 된다.
<br/><br/>
> **왜 Java Bean을 쓰는가?**

&nbsp;JSP의 화면을 보여주는 View 페이지에 Java 코드와 HTML 코드를 함께 작성하면 가독성이 떨어지고 웹 페이지 디자이너의 입장에서 편집하기 까다로울 수 밖에 없다. 그래서 Java 클래스 객체 부분의 코드를 따로 분리하여 작성한다면 **가독성**과 **업무 분담** 측면에서 효율성을 높일 수 있다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTczNTM0MDE3NCwtMTE0MDI3ODQ0NywxMD
I5NTAwMDQwLDE3MjUwNTQ3ODEsNzc2ODUzOTI4LC0xNTEwMTAw
NjgxXX0=
-->
