package fr.airv.web.soyonline.model;


import java.io.Serializable;

/**
 * AJAX request result container.
 * 
 * @author herve
 *
 */
public class AjaxResult {

  /**
   * Flag telling if the result is a success.
   */
  private boolean success;

  /**
   * Content of the response.
   */
  private Serializable content;

  /**
   * Constructor with content.
   * @param content Content to send.
   */
  public AjaxResult(Serializable content) {
    this.setContent(content);
  }

  /**
   * Default constructor.
   */
  public AjaxResult() {
  }

  public boolean isSuccess() {
    return success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
  }

  public Object getContent() {
    return content;
  }

  public void setContent(Serializable content) {
    this.content = content;
  }
}
