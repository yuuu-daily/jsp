<%@ page contentType="text/html; charset=UTF-8" %>
<%
  session.setMaxInactiveInterval(180);
  String logout = (String)request.getParameter("logout");
  String email = null;
  if (logout != null && logout.equals("true")) {
     session.invalidate();
  } else {
    email = (String)request.getParameter("email");
    if (email != null) {
      session.setAttribute("email", email);
    }
    email = (String)session.getAttribute("email");
  }
  if (email == null) email = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerEmail</title>
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
  <form method="GET" action="/jsp/registerEmail.jsp">
    <ul>
      <li><label for="email">E メール</><input type="text" name="email" value="<%= email %>"/></li>
      <li><input type="submit" value="登録" /><a href="/jsp/registerEmail.jsp?logout=true">ログアウト</a></li>
    </ul>
  </form>
</body>
</html>