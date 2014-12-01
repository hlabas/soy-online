<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="stripes"
	uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Soy online compiler</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<style type="text/css">

/* Sticky footer styles
-------------------------------------------------- */
html {
	position: relative;
	min-height: 100%;
}

body {
	/* Margin bottom by footer height */
	margin-bottom: 60px;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 60px;
	background-color: #f5f5f5;
	padding: 20px;
}

/* Custom page CSS
-------------------------------------------------- */
/* Not required for template or sticky footer method. */
.container {
	width: auto;
	padding: 0 15px;
}

.container .text-muted {
	margin: 20px 0;
}

#errorMessage {
	padding: 10px;
}

#inputSource {
	height: 100%;
	min-height: 400px;
}
</style>
</head>
<body>

	<header class="page-header">
		<div class="container">
			<h1>Soy online compiler</h1>
			<p class="lead">You can now easily compile your Soy templates.</p>
		</div>
	</header>
	<div class="container">
		<stripes:form beanclass="fr.airv.web.soyonline.actions.Compile"
			focus="inputSource">
			<section class="col-md-6">
				<h2>Input source</h2>
				<stripes:textarea style="width: 100%; height: 100%"
					name="inputSource" id="inputSource">
{namespace test}

/**
 * This is a default template.
 */
{template .main}
Hello world!
{/template}
</stripes:textarea>
			</section>
			<section id="result" class="col-md-6">
				<c:if test="${actionBean.compileError != null}">
					<div id="errorMessage">
						<h2>Compilation error</h2>
						<code class="bg-danger"> ${actionBean.compileError}</code>
					</div>
				</c:if>
				<c:if test="${actionBean.compiled != null}">
					<h2>Compiled result</h2>
					<pre id="compiled">${actionBean.compiled}</pre>
					<button id="download" role="submit" name="download" class="btn btn-default btn-sm"
						title="Download">
						<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
					</button>
				</c:if>
			</section>

			<div class="col-md-12">
				<button name="compile" role="submit" class="btn btn-primary btn-lg">
					<span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>
					Compile
				</button>
			</div>
		</stripes:form>
	</div>

	<footer class="footer">
		<div class="container">
			<cite class="text-muted">Author: Hervé Labas</cite>
		</div>
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>