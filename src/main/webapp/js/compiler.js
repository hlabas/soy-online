/**
 * Compilation result.
 */
var compiled = null;

/**
 * CodeMirror instance.
 */
var editor = null;

/**
 * Compiles and provides with status and error message.
 * @param e Click event.
 */
function compile(e) {
  e.preventDefault();
  requestCompilation(false);
}

/**
 * Downloads the compiled file.
 * @param e Click event.
 */
function download(e) {
  e.preventDefault();
  requestCompilation(true);
}

/**
 * Compiles an optionally downloads the result.
 * @param download Flag to request downloading the result.
 */
function requestCompilation(download) {
  $('#compileBtn').button('loading');
  $('#compileSuccess').hide();
  $('#compileFailure').hide();
  $()
  editor.save();
  $.post(BASE_PATH + 'compile/verify', {
    inputSource: $('#inputSource').val(),
    name: "compile"
  }, function(data) {
    $('#compileBtn').button('reset');
    if (data.success) {
      compileSuccess(data.content, download);
    }
    else {
      compileFailure(data.content);
    }
  },
  'json');
}

/**
 * Confirms the compilation is a success.
 * @param result The compilation result.
 * @param download Flag requesting to trigger a download of the compiled result
 */
function compileSuccess(result, download) {
  $('#compilationSuccess').show();
  if (download) {
    var blob = new Blob([result], {type: "text/javascript;charset=utf-8"});
    saveAs(blob, "compiled.js");
  }
}

/**
 * Shows the compilation error.
 * @param errorMessage The compilation error.
 */
function compileFailure(errorMessage) {
  $('#compileFailure').show();
  $('#compilationMessage').text(errorMessage);
  $('#compileErrorModal').modal('show');
}

function toggleFullscreen() {
  editor.setOption('fullScreen', !editor.getOption('fullScreen'));
}

/**
 * On document load, initialise handlers.
 */
$(function(){
  $('#fsBtn').click(toggleFullscreen);
  $('#compileBtn').click(compile);
  $('#downloadBtn').click(download);
  editor = CodeMirror.fromTextArea(
    document.getElementById('inputSource'), {
      indentWithTabs: false,
      lineNumbers: true,
      matchBrackets: true,
      autoCloseTags: true,
      matchTags: true,
      mode: 'text/x-soy',
      viewportMargin: Infinity,
      tabSize: 2,
      extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Enter": function(cm) {
          cm.setOption('fullScreen', !cm.getOption('fullScreen'));
        },
      }
  });
})