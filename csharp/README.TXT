ANTLR V3.1 Examples for the C# Code-Generator and Runtime

30 October, 2007

Kunle Odutola		: kunle UNDERSCORE odutola AT hotmail DOT com


HOW TO BUILD

1. Obtain and install dependencies

   What you will need:
   - NAnt v0.85 or later (must be installed and available on the system PATH)
   
   - 'antlr-2007-10-29.14.jar' from ANTLR v3.1b [currently antlr-2007-10-29.14.tar.gz]
   
   - 'antlr-2.7.7.jar' from ANTLR v2.7.7 [or ANTLR v3.1b]
   
   - 'stringtemplate-3.1b1.jar' from Java StringTemplate v3.1b1 [or ANTLR v3.1b]
   
   - 'StringTemplate.dll' from C# StringTemplate v3.1b1 [or ANTLR V3.1 C# runtime]
   
   - 'antlr.runtime.dll'  from C# StringTemplate v3.1b1 [or ANTLR V3.1 C# runtime]
   
   - 'Antlr3.Runtime.dll' from ANTLR V3.1 C# runtime
   
   
   NOTE: The C# binaries are available as .NET v1.1. and .NET v2.0 assemblies.
   
   
   
   Copy the following files to the directory indicated. Please note that you may 
   have to rename some of these files (e.g. 'antlr-2.7.7.jar' may actually be named
   'antlr.jar' in the ANTLR 2.7.7 distribution).
   
   NOTE: As an alternative to renaming files (for those familiar with editing NAnt 
   build files), you may change the names that the build files expects.
   
   File                           Destination
   ---------------------------------------------------------------------------
   antlr-2007-10-29.14.jar   -->  csharp/_SharedLibs/antlr-v3.x.jar
   antlr-2.7.7.jar           -->  csharp/_SharedLibs/antlr-2.7.7.jar
   stringtemplate-3.1b1.jar  -->  csharp/_SharedLibs/stringtemplate-v3.x.jar
   
   For .NET v1.1 (for use on Mono, replace 'net-1.1' with 'mono-1.0')
   Antlr3.Runtime.dll        -->  csharp/_SharedLibs/net-1.1/Antlr3.Runtime.dll
   StringTemplate.dll        -->  csharp/_SharedLibs/net-1.1/StringTemplate.dll
   antlr.runtime.dll         -->  csharp/_SharedLibs/net-1.1/antlr.runtime.dll
   
   For .NET v2.0 (for use on Mono, replace 'net-2.0' with 'mono-2.0')
   Antlr3.Runtime.dll        -->  csharp/_SharedLibs/net-2.0/Antlr3.Runtime.dll
   StringTemplate.dll        -->  csharp/_SharedLibs/net-2.0/StringTemplate.dll
   antlr.runtime.dll         -->  csharp/_SharedLibs/net-2.0/antlr.runtime.dll


2. Use the NAnt build files

   From the top-level directory of the csharp examples, type the following:
   
      nant
   
   This will display information about the available build targets. You can 
   only build ALL the targets from this level. Type the following to build ALL
   the examples:
   
      nant clean build -t:net-1.1       (or net-2.0, mono-1.0, mono-2.0)



   To build individual targets, type the following from the directory of the
   individual examples:
   
      nant clean build -t:net-1.1       (or net-2.0, mono-1.0, mono-2.0)


NOTES
	a. The Ruby example grammar (if it is included) is somewhat outdated. It
	   will fail to process Ruby source files orrectly. It is unchanged 
	   essentially since the 3.0eaX timeframe.
	   
	   
Enjoy!

Kunle Odutola
