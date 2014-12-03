<%@ include file="/inc/taglibs.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<s:layout-render name="/layout/main.jsp">

	<s:layout-component name="css">
	<style>
	#errorMessage {
		padding: 10px;
		display: none;
	}
	
	#inputSource {
		height: 100%;
		min-height: 400px;
	}
	
	.big {
	  vertical-align: middle;
	  font-size: 35px;
	}
	
	.success {
	  color: #69d32c;
	}
	
  .failure {
    color: #b72424;
  }
  </style>
	</s:layout-component>
	
	<s:layout-component name="header">
		<h1>Soy online compiler</h1>
		<p class="lead">You can now easily compile your Soy templates.</p>
	</s:layout-component>
	<s:layout-component name="body">
	<s:form beanclass="fr.airv.web.soyonline.actions.CompileActionBean"
		focus="inputSource">
		<section class="col-md-8">
			<h2>Soy source</h2>
			<s:textarea style="width: 100%; height: 100%"
				name="inputSource" id="inputSource">
{namespace test}

/**
 * This is a default template.
 */
{template .main}
Hello world!
{/template}</s:textarea>
		</section>
		<section id="result" class="col-md-4">
      <h2>Compile &amp; download!</h2>
      <div class="btn-group" role="group" aria-label="Actions">
	      <button id="compileBtn" type="button" name="compile" class="btn btn-default btn-lg">
	        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
	        Compile
	      </button>
	      <button id="downloadBtn" type="button" name="download" class="btn btn-primary btn-lg">
	        <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
	        Download
	      </button>
      </div>
      <span class="glyphicon big" aria-hidden="true" id="compilationStatus"></span>
			<div id="errorMessage">
				<code class="bg-danger" id="compileError"></code>
			</div>
		</section>
	</s:form>
	</s:layout-component>
  <s:layout-component name="jsSources">
  <script src="${ctx}/js/FileSaver.min.js"></script>
  <script src="${ctx}/js/compiler.js"></script>
  </s:layout-component>
</s:layout-render>