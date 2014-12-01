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

@UrlBinding("/action/")
public class Compile implements ActionBean {
	private ActionBeanContext context;
	private String inputSource;
	private String compiled;
	private SoySyntaxException compileError;
	
	@Override
	public ActionBeanContext getContext() {
		return context;
	}

	@Override
	public void setContext(ActionBeanContext context) {
		this.context = context;
	}
	
	@DefaultHandler
	public Resolution showCompiler() {
		return new ForwardResolution("/jsp/compiled.jsp");
	}
	
	public Resolution compile() {
		doCompile();
		return new ForwardResolution("/jsp/compiled.jsp");
	}
	
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

	private void doCompile() {
		List<Module> guiceModules = Lists.newArrayListWithCapacity(1);
		guiceModules.add(new JsSrcModule());
		Injector injector = Guice.createInjector(guiceModules);
		
		SoyFileSet.Builder sfsBuilder = injector.getInstance(SoyFileSet.Builder.class);
		sfsBuilder.add(getInputSource(), "");
		SoyJsSrcOptions jsSrcOptions = new SoyJsSrcOptions();
		jsSrcOptions.setIsUsingIjData(false);
	    jsSrcOptions.setCodeStyle(CodeStyle.CONCAT);
	    jsSrcOptions.setShouldGenerateJsdoc(false);
	    jsSrcOptions.setShouldProvideRequireSoyNamespaces(false);
	    jsSrcOptions.setShouldDeclareTopLevelNamespaces(true);
	    jsSrcOptions.setShouldGenerateGoogMsgDefs(false);
	    jsSrcOptions.setGoogMsgsAreExternal(false);
	    try {
	    	List<String> result = sfsBuilder.build().compileToJsSrc(jsSrcOptions, null);
	    	setCompiled(result.get(0));
	    }
	    catch (SoySyntaxException ex) {
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
