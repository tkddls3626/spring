<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%
	//Controller에서 model.addAttribute("res",String.valueOf(res)); 로부터 저장된 값불러오기
	//CmmUtil.nvl() 함수를 통해 model.addAttribute("res")저장한 값이 NULL인경우, 0으로 저장되도록 로직처리함
	//0이면 메일 발송 실패하는 것으로 스프링의 Service에서 정의했기 때문에 0으로 한것임
	String jspRes =  CmmUtil.nvl((String)request.getAttribute("res"),"0");
	
	//웹 URL로부터 전달받는 값을(스프링은 기본적으로 포워드 방식으로 페이지를 이동하기 때문에 url에 입력받은 request 값을 가져올수 있음 ,일반적인 jsp에선 불가능)
	String toMail = CmmUtil.nvl(request.getParameter("toMail")); // 받는사람
	String title = CmmUtil.nvl(request.getParameter("title")); // 제목
	String contents = CmmUtil.nvl(request.getParameter("contents")); //내용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 발송 결과 보기</title>
</head>
<body>
	
	<%
	//메일 발송 성공
	if(jspRes.equals("1")){
		
	out.println(toMail+"로 메일 전송이 성공하였습니다");
	out.println("메일 제목"+title);
	out.println("메일 내용"+contents);
	}else{
		out.println(toMail+"로 메일 전송이 실패하였습니다");
	}
	%>
	
</body>
</html>