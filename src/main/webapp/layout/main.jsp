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
	  padding: 10px 10px 10px 30px;
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
	.page-header {
    margin: 70px 0 0 0;
    border: none;
	}
	</style>
	<s:layout-component name="css" />
</head>
<body>
  <nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Soy online</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#aboutModal" data-toggle="modal">About</a></li>
        </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a class="label-danger" href="https://github.com/hlabas/soy-online.git" style="color: white;">Fork on Github</a></li>
	      </ul>
      </div>
    </div>
  </nav>
    
  <header class="page-header">
    <div class="container">
      <s:layout-component name="header" />
    </div>
  </header>
  
  <s:layout-component name="body" />

  <footer class="footer">
    <s:layout-component name="footer" />
  </footer>
  
  <div class="modal fade" id="aboutModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">About Soy Online</h4>
        </div>
        <div class="modal-body">
	        <p>Version: 1.1</p> 
	        <p>Author: <a href="https://twitter.com/hervelabas" target="_blank">Hervé Labas</a></p> 
	        <p>Editor: <a href="https://codemirror.net/" target="_blank">CodeMirror</a></p>
	        <p>Compiler: <a href="https://developers.google.com/closure/templates/docs/helloworld_js" target="_blank">Closure templates</a></p>
        </div>
      </div>
    </div>
  </div>
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script>
  var BASE_PATH = '${ctx}/action/';
  $(function () {
    $('[data-toggle="popover"]').popover();
  });
  </script>
  <s:layout-component name="jsSources" />
</body>
</html>
</s:layout-definition>