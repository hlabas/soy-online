<%@ include file="/inc/taglibs.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<s:layout-definition>
<!DOCTYPE html>
<html>
<head>

  <%@ include file="/inc/htmlHead.jspf" %>
	<style type="text/css">
	@import url(http://fonts.googleapis.com/css?family=Ubuntu+Mono);
	
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
	
	textarea {
	 font-family: 'Ubuntu Mono', monospace;
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
	</style>
	<s:layout-component name="css" />
</head>
<body>
  <a href="https://github.com/hlabas/soy-online.git"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"></a>

  <header class="page-header">
    <div class="container">
      <s:layout-component name="header" />
    </div>
  </header>
  <div class="container">
    <s:layout-component name="body" />
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
  <script>
  var BASE_PATH = '${ctx}/action/';
  </script>
  <s:layout-component name="jsSources" />
</body>
</html>
</s:layout-definition>