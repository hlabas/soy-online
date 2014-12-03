package fr.airv.web.soyonline.actions;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;

@UrlBinding(SoyOnlineActionBean.BASE_PATH)
public class HomeActionBean extends SoyOnlineActionBean {

  /**
   * Displays the main compilation page.
   * 
   * @return The main JSP resolution.
   */
  @DefaultHandler
  public Resolution showCompiler() {
    return new ForwardResolution("/jsp/home.jsp");
  }
}
