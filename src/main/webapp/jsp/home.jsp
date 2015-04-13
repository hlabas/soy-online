<%@ include file="/inc/taglibs.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<s:layout-render name="/layout/main.jsp">

	<s:layout-component name="link">
	  <link rel="stylesheet" href="${ctx}/libs/codemirror/codemirror.css" type="text/css">
	  <link rel="stylesheet" href="${ctx}/libs/codemirror/show-hint.css" type="text/css">
	</s:layout-component>
	
	<s:layout-component name="css">
	<style>
	#inputSource {
		width: 100%;
		height: 100%;
		min-height: 500px;
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
  
  .status {
    display: none;
  }
  </style>
	</s:layout-component>
	
	<s:layout-component name="header">
		<p class="lead" style="margin-bottom: 0">
		  Edit and compile Soy templates online.
	  </p>
	</s:layout-component>
	<s:layout-component name="body">
	<s:form beanclass="fr.airv.web.soyonline.actions.CompileActionBean"
		focus="inputSource">
			<s:textarea
				name="inputSource" id="inputSource">
{namespace test}

/**
 * This is a default template.
 */
{template .main}
Hello world!
{/template}</s:textarea>
	</s:form>
	</s:layout-component>
  <s:layout-component name="footer">
      <div class="btn-group" role="group" aria-label="Actions">
        <button id="compileBtn" type="button" name="compile" class="btn btn-default">
          <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
          Compile
        </button>
        <button id="downloadBtn" type="button" name="download" class="btn btn-primary">
          <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
          Download
        </button>
      </div>
      <span class="glyphicon big glyphicon-ok-sign status success" aria-hidden="true" id="compilationSuccess"></span>
      <button id="compileFailure" type="button" class="btn btn-lg btn-danger status">
        <span class="glyphicon big glyphicon-remove-circle" aria-hidden="true" id="compilationErrorIcon"></span>
      </button> 
      <!-- <span class="small">Tip: drag and drop your file on the area to edit</span> -->
  </s:layout-component>
  <s:layout-component name="jsSources">
  <script src="${ctx}/libs/codemirror/codemirror-compressed.js"></script>
  <script src="${ctx}/js/soy-hint.js"></script>
  <script src="${ctx}/js/FileSaver.min.js"></script>
  <script src="${ctx}/js/compiler.js"></script>
  </s:layout-component>
</s:layout-render>