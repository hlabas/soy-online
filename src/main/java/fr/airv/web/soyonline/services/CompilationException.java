package fr.airv.web.soyonline.services;


import com.google.template.soy.base.SoySyntaxException;

/**
 * Compilation error exception.
 * @author herve
 */
public class CompilationException extends Exception {

  /**
   * Serial UID.
   */
  private static final long serialVersionUID = 3102386191894455147L;

  /**
   * Source file where the error was detected.
   */
  private String source;

  /**
   * Line number for the error.
   */
  private int lineNumber;

  /**
   * Builds a compilation error.
   * @param soyEx The original compilation error.
   */
  public CompilationException(SoySyntaxException soyEx) {
    super(soyEx.getMessage(), soyEx);
    this.setSource(soyEx.getSourceLocation().getFilePath());
    this.setLineNumber(soyEx.getSourceLocation().getLineNumber());
  }

  public int getLineNumber() {
    return lineNumber;
  }

  public void setLineNumber(int lineNumber) {
    this.lineNumber = lineNumber;
  }

  public String getSource() {
    return source;
  }

  public void setSource(String source) {
    this.source = source;
  }
}
