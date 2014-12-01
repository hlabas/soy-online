package fr.airv.web.soyonline.actions;


import java.util.List;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import net.sourceforge.stripes.action.UrlBinding;

import com.google.common.collect.Lists;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.google.template.soy.SoyFileSet;
import com.google.template.soy.base.SoySyntaxException;
import com.google.template.soy.jssrc.SoyJsSrcOptions;
import com.google.template.soy.jssrc.SoyJsSrcOptions.CodeStyle;
import com.google.template.soy.jssrc.internal.JsSrcModule;

/**
 * Main compilation action bean class.
 * Exposes 3 entry points:
 * <ol>
 * <li>Main display</li>
 * <li>Compiling</li>
 * <li>Compiling and downloading result</li>
 * </ol>
 * 
 * @author Hervé Labas
 *
 */
@UrlBinding("/action/")
public class Compile implements ActionBean {

  /**
   * Stripes context.
   */
  private ActionBeanContext context;

  /**
   * Soy input source to compile.
   */
  private String inputSource;

  /**
   * Source compiled as JS code.
   */
  private String compiled;

  /**
   * Compilation error.
   */
  private SoySyntaxException compileError;

  @Override
  public ActionBeanContext getContext() {
    return context;
  }

  @Override
  public void setContext(ActionBeanContext context) {
    this.context = context;
  }

  /**
   * Displays the main compilation page.
   * @return The main JSP resolution.
   */
  @DefaultHandler
  public Resolution showCompiler() {
    return new ForwardResolution("/jsp/compiled.jsp");
  }

  /**
   * Compiles the current source input and renders the compiled result.
   * @return The main JSP resolution.
   */
  public Resolution compile() {
    doCompile();
    return new ForwardResolution("/jsp/compiled.jsp");
  }

  /**
   * Compiles and then streams the result back to the client as a file attachment.
   * @return The main JSP resolution.
   */
  public Resolution download() {
    doCompile();
    if (this.compiled != null) {
      StreamingResolution res = new StreamingResolution("application/javascript", this.compiled);
      res.setAttachment(true);
      res.setFilename("compiled.js");
      return res;
    }
    return new ForwardResolution("/jsp/compiled.jsp");
  }

  /**
   * Proceeds to the actual compilation of the source input.
   */
  private void doCompile() {
    // Initialise Guice
    List<Module> guiceModules = Lists.newArrayListWithCapacity(1);
    guiceModules.add(new JsSrcModule());
    Injector injector = Guice.createInjector(guiceModules);

    // Create file builder to add the source entry
    SoyFileSet.Builder sfsBuilder = injector.getInstance(SoyFileSet.Builder.class);
    sfsBuilder.add(getInputSource(), "");
    
    // Default options
    // TODO: propose to adjust some options from the UI
    SoyJsSrcOptions jsSrcOptions = new SoyJsSrcOptions();
    jsSrcOptions.setIsUsingIjData(false);
    jsSrcOptions.setCodeStyle(CodeStyle.CONCAT);
    jsSrcOptions.setShouldGenerateJsdoc(false);
    jsSrcOptions.setShouldProvideRequireSoyNamespaces(false);
    jsSrcOptions.setShouldDeclareTopLevelNamespaces(true);
    jsSrcOptions.setShouldGenerateGoogMsgDefs(false);
    jsSrcOptions.setGoogMsgsAreExternal(false);
    
    // Compile
    try {
      List<String> result = sfsBuilder.build().compileToJsSrc(jsSrcOptions, null);
      setCompiled(result.get(0));
    } catch (SoySyntaxException ex) {
      setCompileError(ex);
    }
  }

  public String getCompiled() {
    return compiled;
  }

  public void setCompiled(String compiled) {
    this.compiled = compiled;
  }

  public SoySyntaxException getCompileError() {
    return compileError;
  }

  public void setCompileError(SoySyntaxException compileError) {
    this.compileError = compileError;
  }

  public String getInputSource() {
    return inputSource;
  }

  public void setInputSource(String inputSource) {
    this.inputSource = inputSource;
  }

}
