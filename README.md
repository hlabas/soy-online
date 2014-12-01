Soy online
==========

Soy templates online compiler. 
Wraps the [Soy compiler](https://developers.google.com/closure/templates/docs/helloworld_js) in a Java webapp to ease the Soy compiling process.

Usage
------

Type in your Soy code in the input source field, click "Compile" and that's it!

Running the source code
------

This project runs on Google App Engine and leverages the [Stripes framework](https://stripesframework.atlassian.net/wiki/display/STRIPES/Quick+Start+Guide) as an MVC controller.

[Maven](http://maven.apache.org) is used mainly for dependency management.

> *Note:*
> The SoyToJsSrcCompiler.jar being outside of Maven official repository, you'll need to add it manually to compile, like this:

```shell
mvn install:install-file -DgroupId=com.google.template.soy -DartifactId=soy-js-compiler -Dversion=1.0-SNAPSHOT -Dpackage=jar -Dfile=SoyToJsSrcCompiler.jar
```

I've used eclipse Luna with the [Google Plugin](https://cloud.google.com/appengine/docs/java/tools/eclipse#Running_the_Project) without any major issue.
