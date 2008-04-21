
To compile and run the examples perform the following:

	1. Copy the ActionScript runtime antlr3.swc to the "lib" directory.
	2. Copy or place on the CLASSPATH all files to run the ANTLR tool.  These include:
		a. antlr-3.1.jar - the ANTLR 3.1 runtime
		b. antlr-2.7.7.jar - the ANTLR 2.7.7 runtime
		c. string-template-3.1.jar - the String Template 3.1 runtime
	3. Set the environment variable FLEX_HOME to the directory containing the FLEX 3.0 SDK.
	3. Run "build_all.sh" to build and verify every example. 

Note all examples are built as Adobe AIR applications in order to support file system access.  The Adobe AIR Debugger "adl" is used to run the programs which is included in the Flex SDK.  It is not necessary to install the Adobe AIR Runtime to run the examples.
