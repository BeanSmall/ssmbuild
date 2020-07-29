<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>login登录动效</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<link rel="stylesheet" href="/static/css/login.css">
	</head>
	<body>
		<div class="main">
			<div class="login">
				<div class="log-con">
					<span>登录</span>
					<form action="dologin" method="post">
						<input type="text" class="name" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off">
						<input type="password" class="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off">
						<input type="text" class="code" placeholder="请输入验证码">
						<input type="button" id="code" onclick="change();" value="FMEK">
						<input class="btn_login" type="submit"  value="立即登录">
					</form>
				</div>
			</div>
		</div>
		<div class="copyright">
		</div>
		<script src="/static/js/jquery-1.10.2.min.js"></script>
		<script src="/static/js/three.min.js"></script>
		<script src="/static/js/login.js"></script>
	</body>
</html>
