ANTLR V3 Examples for the C# Code-Generator and Runtime

9 November, 2006

Kunle Odutola		: kunle UNDERSCORE odutola AT hotmail DOT com


HOW TO BUILD

1. Obtain and install dependencies

   What you will need:
   - NAnt v0.85 or later (must be installed and available on the system PATH)
   
   - 'antlr-3.0b5.jar' from ANTLR v3.0b5
   
   - 'antlr-2.7.7.jar' from ANTLR v2.7.7
   
   - 'stringtemplate.jar' from Java StringTemplate v3.0
   
   - 'StringTemplate.dll' and 'antlr.runtime.dll' from C# StringTemplate v3.0
   
   - 'Antlr3.Runtime.dll' the ANTLR V3 C# runtime
   
   
   NOTE: The C# binaries are available as .NET v1.1. and .NET v2.0 assemblies.
   
   
   
   Copy the following files to the directory indicated. Please note that you may 
   have to rename some of these files (e.g. 'antlr-2.7.7.jar' may actually be named
   'antlr.jar' in the ANTLR 2.7.7 distribution).
   
   NOTE: As an alternative to renaming files (for those familiar with editing NAnt 
   build files), you may change the names that the build files expects.
   
   File                       Destination
   ---------------------------------------------------------------------------
   antlr-3.0b5.jar       -->  csharp/_SharedLib/antlr-3.0b5.jar
   antlr-2.7.7.jar       -->  csharp/_SharedLib/antlr-2.7.7.jar
   stringtemplate.jar    -->  csharp/_SharedLib/stringtemplate.jar
   
   For .NET v1.1 (for use on Mono, replace 'net-1.1' with 'mono-1.0')
   Antlr3.Runtime.dll    -->  csharp/_SharedLib/net-1.1/Antlr3.Runtime.dll
   StringTemplate.dll    -->  csharp/_SharedLib/net-1.1/StringTemplate.dll
   antlr.runtime.dll     -->  csharp/_SharedLib/net-1.1/antlr.runtime.dll
   
   For .NET v2.0 (for use on Mono, replace 'net-2.0' with 'mono-2.0')
   Antlr3.Runtime.dll    -->  csharp/_SharedLib/net-2.0/Antlr3.Runtime.dll
   StringTemplate.dll    -->  csharp/_SharedLib/net-2.0/StringTemplate.dll
   antlr.runtime.dll     -->  csharp/_SharedLib/net-2.0/antlr.runtime.dll


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


Enjoy!

Kunle Odutola
