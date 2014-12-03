package fr.airv.web.soyonline.services;


import java.util.List;

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
 * Compilation service proposing String based compilation.
 * 
 * @author herve
 */
public class CompilationService {

  /**
   * Guice injector for accessing initialised compiler objects.
   */
  private static Injector injector;

  /**
   * Initialise Guice module for compiler.
   */
  static {
    List<Module> guiceModules = Lists.newArrayListWithCapacity(1);
    guiceModules.add(new JsSrcModule());
    injector = Guice.createInjector(guiceModules);
  }

  /**
   * Compiles provided source code with default compilation options.
   * 
   * @param inputSource Soy source to compile.
   * @return Compiled JS code.
   * @throws SoySyntaxException Whenever a compilation error occurs.
   */
  public String compileSource(String inputSource) throws CompilationException {
    return compileSource(inputSource, getDefaultCompilationOptions());
  }

  /**
   * Compiles provided source code with provided compilation options.
   * 
   * @param inputSource Soy source to compile.
   * @param jsSrcOptions The compiler options.
   * @return Compiled JS code.
   * @throws SoySyntaxException Whenever a compilation error occurs.
   */
  public String compileSource(String inputSource, SoyJsSrcOptions jsSrcOptions)
      throws CompilationException {
    SoyFileSet.Builder sfsBuilder = injector.getInstance(SoyFileSet.Builder.class);
    sfsBuilder.add(inputSource, "inline");
    try {
      List<String> result = sfsBuilder.build().compileToJsSrc(jsSrcOptions, null);
      return result.get(0);
    }
    catch (SoySyntaxException ex) {
      throw new CompilationException(ex);
    }
  }

  /**
   * @return Default Soy JS compilation options.
   */
  private SoyJsSrcOptions getDefaultCompilationOptions() {
    SoyJsSrcOptions jsSrcOptions = new SoyJsSrcOptions();
    jsSrcOptions.setIsUsingIjData(false);
    jsSrcOptions.setCodeStyle(CodeStyle.CONCAT);
    jsSrcOptions.setShouldGenerateJsdoc(false);
    jsSrcOptions.setShouldProvideRequireSoyNamespaces(false);
    jsSrcOptions.setShouldDeclareTopLevelNamespaces(true);
    jsSrcOptions.setShouldGenerateGoogMsgDefs(false);
    jsSrcOptions.setGoogMsgsAreExternal(false);
    return jsSrcOptions;
  }
}
