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
		height: auto;
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
    position: absolute;
    right: 10px;
    top: 8px;
  }
  
  .CodeMirror {
    border: 1px solid #eee;
    height: auto;
  }
  
  #actions {
    position: relative;
    width: 270px;
  }
  
  #actions .btn-group {
    position: absolute;
    left: 10px;
    top: 8px;
  }
  
  #compilationErrorIcon {
    font-size: 16px;
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
  <s:layout-component name="navright">
    <li>
      <div id="actions">
	      <div class="btn-group" role="group" aria-label="Actions">
	        <button id="compileBtn" type="button" data-loading-text="Compiling..." name="compile" class="btn btn-default">
	          <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
	          Compile
	        </button>
	        <button id="downloadBtn" type="button" name="download" class="btn btn-primary">
	          <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
	          Download
	        </button>
	      </div>
	      <span class="glyphicon big glyphicon-ok-sign status success" aria-hidden="true" id="compilationSuccess"></span>
	      <button id="compileFailure" type="button" 
		      data-toggle="modal" data-target="#compileErrorModal" class="btn btn-danger status">
	        <span class="glyphicon glyphicon-remove-circle" aria-hidden="true" id="compilationErrorIcon"></span>
	      </button> 
	      <!-- <span class="small">Tip: drag and drop your file on the area to edit</span> -->
      </div>
    </li>
  </s:layout-component>
  <s:layout-component name="bottom">
	  <div class="modal fade" id="compileErrorModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title">Compilation error</h4>
	        </div>
	        <div class="modal-body" id="compilationMessage">
	        </div>
	      </div>
	    </div>
	  </div>
  </s:layout-component>
  <s:layout-component name="jsSources">
  <script src="${ctx}/libs/codemirror/codemirror-compressed.js"></script>
  <script src="${ctx}/js/soy-hint.js"></script>
  <script src="${ctx}/js/FileSaver.min.js"></script>
  <script src="${ctx}/js/compiler.js"></script>
  </s:layout-component>
</s:layout-render>