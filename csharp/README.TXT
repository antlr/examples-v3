ANTLR V3.2 Examples for the C# Code-Generator and Runtime

20 April, 2010

Johannes Luber:  jaluber AT gmx DOT de


HOW TO BUILD

1. Obtain and install dependencies

   What you will need with using CSharp2 target:      - NAnt v0.85 or later (must be installed and available on the system PATH)   - 'antlr-3.2.jar' from ANTLR v3.2   - 'stringtemplate-3.2.1.jar' from Java StringTemplate v3.2.1 [or ANTLR v3.2]   - 'Antlr3-2.Runtime.DotNet20' from ANTLR V3.2 C# runtime   - 'StringTemplate.dll' from C# StringTemplate v3.1b1 [or ANTLR V3.2 C# runtime]   - 'antlr.runtime.dll'  from C# StringTemplate v3.1b1 [or ANTLR V3.2 C# runtime].   
   Copy the following files to the directory indicated below. Please note that you may 
   have to rename some of these files, so the build files find them.
   
   NOTE: As an alternative to renaming files (for those familiar with editing NAnt 
   build files), you may change the names that the build files expects. It is   recommend to change the file names directly to prevent any breakage from updates.
   
   File                           Destination
   ---------------------------------------------------------------------------
   antlr-3.2.jar                 -->  csharp/_SharedLibs/antlr-v3.x.jar
   stringtemplate-3.2.1.jar      -->  csharp/_SharedLibs/stringtemplate-v3.x.jar   
   For .NET v2.0 (for use on Mono, replace 'net-2.0' with 'mono-2.0')
   Antlr3-2.Runtime.DotNet20.dll -->  csharp/_SharedLibs/net-2.0/Antlr3-2.Runtime.DotNet20.dll   StringTemplate.dll            -->  csharp/_SharedLibs/net-2.0/StringTemplate.dll   antlr.runtime.dll             -->  csharp/_SharedLibs/net-2.0/antlr.runtime.dll
   
   BEWARE: If using CSharp2 on a .NET 3.5 installation, replace 'net-2.0' with 'net-3.5'.1.1 Switching to ST# 3.2 and possibly CSharp3      Using the newer ST# 3.2 is not possible currently because the assemblies are tied   to .NET 3.5 and CSharp2 requires backward compatibility to .NET 2.0. If the   deployment environment allows the use of .NET 3.5 then you have to compile a   version of the CSharp2 runtime with the ST# 3.2 yourself and make the following   changes.      If you just want to use ST# 3.2 replace StringTemplate.dll and antlr.runtime.dll with   - 'Antlr3.StringTemplate.dll' from C# StringTemplate v3.2   - 'Antlr3.Runtime.dll'  from C# StringTemplate v3.2   - 'Antlr3.Runtime.Debug.dll'  from C# StringTemplate v3.2      If you want to use the CSharp3 target exclusively then delete Antlr3-2.Runtime.DotNet20.dll.   Furthermore you have to edit in the subdirectory build files the following lines:      			<include name="Antlr3-2.Runtime.DotNet20.dll" />			<include name="antlr.runtime.dll" />			<include name="StringTemplate.dll" />   If you want only to update to ST# 3.2 then the result should be:			   			<include name="Antlr3-2.Runtime.DotNet20.dll" />			<include name="Antlr3.Runtime.dll" />			<include name="Antlr3.Runtime.Debug.dll" />			<include name="Antlr3.StringTemplate.dll" />      If you want to use CSharp3 exclusively then the result should be:			<include name="Antlr3.Runtime.dll" />			<include name="Antlr3.Runtime.Debug.dll" />			<include name="Antlr3.StringTemplate.dll" />				There is no version of CSharp3 working with an older version of ST#.   2. Use the NAnt build files

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
