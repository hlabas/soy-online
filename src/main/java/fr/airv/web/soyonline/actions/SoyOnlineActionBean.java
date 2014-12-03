package fr.airv.web.soyonline.actions;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;

/**
 * Base class for the app's action beans.
 * @author herve
 */
public class SoyOnlineActionBean implements ActionBean {

  protected static final String BASE_PATH = "/action/";
  
  /**
   * The ActionBeanContext instance. 
   */
  protected ActionBeanContext ctx;
  
  @Override
  public void setContext(ActionBeanContext context) {
    ctx = context;
  }

  @Override
  public ActionBeanContext getContext() {
    return ctx;
  }

}
