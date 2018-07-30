<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자리 배치</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{
font-family: 'Jeju Gothic', sans-serif;
background-color:#f5f1e8;
}
td:hover{
opacity:0.7;
}
</style>
</head>
<body>
	<%
		request.getParameter("UTF-8");
		int section = Integer.parseInt(request.getParameter("section")); //분단
		int student = Integer.parseInt(request.getParameter("student")); //학생 인원수
		String addText = request.getParameter("addText"); //결원 학생 번호
		String[] test = addText.split(","); //결원 학생 번호 작성시 ',' 로 구분
		int res[] = new int[test.length];
		for (int i = 0; i < test.length; i++) {
			if (!test[i].equals("")) //결원 학생이 null값 -> 결원 학생이 없을 경우
				res[i] = Integer.parseInt(test[i]);
		}
	%>

	<%
		Random rand = new Random();
		int[] seat = new int[student]; //랜덤값 배열로 

		for (int i = 0; i < seat.length; i++) {
			seat[i] = (int) (Math.random() * student) + 1; //랜덤 생성
			for (int j = 0; j < i; j++) {
				if (seat[i] == seat[j]) { //랜덤 값 중복제거
					i--;
					break;
				}
			}
		}

		ArrayList<Integer> numbers1 = new ArrayList<>(); // 좌석
		ArrayList<Integer> numbers2 = new ArrayList<>(); //결원

		//랜덤 값으로 생성된 배열을 다시 ArrayList로 변환
		for (int i = 0; i < seat.length; i++) {
			numbers1.add(seat[i]);
		}

		for (int i = 0; i < res.length; i++) {
			numbers2.add(res[i]);
		}
		
		
		//결원 체크
		if (numbers2 != null)
			for (int i = 0; i < numbers1.size(); i++) {
				for (int j = 0; j < numbers2.size(); j++) {
					if (numbers1.get(i).equals(numbers2.get(j))) { //ArrayList의 get사용
						numbers1.remove(numbers1.get(i)); //ArrayList의 remove 사용
						break;
					}
				}
			}
		//헷갈리까봐 콘솔 창에 한번 찍어주는 건데 없애고 싶으면 없애세요~
		for (int i = 0; i < numbers1.size(); i++) {
			System.out.println("결과 : " + numbers1.get(i));
		}
	%>
	<center>
	<br><br>
	<font style="font-size:1.5em;">자 리 배 치 도</font><br><br><br>
		<table width="70%" style="border: 2px solid white;">
			<tr>
				<td style="color:#777777; text-align: center; height:30px; background-color:#f5dacf;">칠 판</td>
			</tr>
		</table>
		<br>
	
		<table width="70%" height="100%" style="border-spacing: 30px 30px;">
			<tr>
			
				<%
					for (int i = 0; i < numbers1.size(); i++) {
				%>

				<%
					if ((i + 1) % 2 == 0) { //분단 나누는 식
				%>
				<td width="100px" height="50px" style="color:#e2e2e2; border: 2px solid #ecaa92; background-color:#3e547b;"
					align="center"><%=numbers1.get(i)%></td>
				<%
					} else {
				%>
				<td width="100px" height="50px" style="color:#e2e2e2; border: 2px solid #ecaa92;  background-color:#3e547b;"
					align="center"><%=numbers1.get(i)%></td>
				<%
					}
				%>
				<%
					if ((i + 1) % (section * 2) == 0) { //분단 나누는 식
				%>
				<td width="50px" height="50px"></td>
			</tr>
			<tr>
				<%
					}
					}
				%>
			</tr>
			<tr>
				<td colspan="<%=section * 2%>" align="center"></td>
			</tr>
		</table>
	</center>
</body>
</html>