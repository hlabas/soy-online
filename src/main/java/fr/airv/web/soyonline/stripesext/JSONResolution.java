package fr.airv.web.soyonline.stripesext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import net.sourceforge.stripes.action.Resolution;

/**
 * Returns a raw JSON object in the response.
 * @author herve
 */
public class JSONResolution implements Resolution {

  /**
   * Builder JSON
   */
  private Gson builder;
  
  /**
   * Root object to serialize.
   */
  private Object result;

  public JSONResolution(Object result) {
    this.result = result;
    builder = new GsonBuilder().create();
  }

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws Exception {
    response.setContentType("application/json");
    builder.toJson(result, response.getWriter());
  }

}