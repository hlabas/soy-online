package fr.airv.web.soyonline.actions;


import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.HandlesEvent;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import fr.airv.web.soyonline.model.AjaxResult;
import fr.airv.web.soyonline.services.CompilationException;
import fr.airv.web.soyonline.services.CompilationService;
import fr.airv.web.soyonline.stripesext.JSONResolution;

/**
 * Main compilation action bean class. Exposes 3 entry points:
 * <ol>
 * <li>Main display</li>
 * <li>Compiling</li>
 * <li>Compiling and downloading result</li>
 * </ol>
 * 
 * @author Hervé Labas
 *
 */
@UrlBinding("/action/compile/{$event}")
public class CompileActionBean extends SoyOnlineActionBean {

  /**
   * Soy input source to compile.
   */
  private String inputSource;
  
  /**
   * Compilation service. TODO: initialise using Guice.
   */
  private CompilationService compilationService = new CompilationService();

  /**
   * Compiles the current source input and renders the compiled result.
   * 
   * @return The javascript resolution containing the compilation result.
   */
  @HandlesEvent("verify")
  @DefaultHandler
  public Resolution compile() {
    AjaxResult compilationResult = new AjaxResult();
    try {
      String compiled = compilationService.compileSource(getInputSource());
      compilationResult.setContent(compiled);
      compilationResult.setSuccess(true);
    } catch (CompilationException ex) {
      compilationResult.setContent(ex.getMessage());
      compilationResult.setSuccess(false);
    }
    return new JSONResolution(compilationResult);
  }

  public String getInputSource() {
    return inputSource;
  }

  public void setInputSource(String inputSource) {
    this.inputSource = inputSource;
  }

}
