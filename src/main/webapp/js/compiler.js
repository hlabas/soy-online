/**
 * Compilation result
 */
var compiled = null;

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
  $('#compilationStatus').removeClass('glyphicon-remove-circle failure glyphicon-ok-sign success');
  $('#compilationStatus').addClass('glyphicon-refresh');
  $.post(BASE_PATH + 'compile/verify', {
    inputSource: $('#inputSource').val(),
    name: "compile"
  }, function(data) {
    $('#compilationStatus').removeClass('glyphicon-refresh');
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
  $('#compilationStatus').addClass('glyphicon-ok-sign success');
  $('#compilationStatus').removeClass('glyphicon-remove-circle failure');
  $('#compileError').text('');
  $('#errorMessage').hide();
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
  $('#compilationStatus').removeClass('glyphicon-ok-sign success');
  $('#compilationStatus').addClass('glyphicon-remove-circle failure');
  $('#compileError').text(errorMessage);
  $('#errorMessage').show();
}

/**
 * On document load, initialise handlers.
 */
$(function(){
  $('#compileBtn').click(compile);
  $('#downloadBtn').click(download);
})