/** \file
 * This is the include file for the ANTLR3 sample project "polydiff"
 * which shows how to use a grammar to generate an AST and parse it.
 */
#ifndef	_POLYDIFFDEFS_H
#define	_POLYDIFFDEFS_H

#ifdef	__xlc__
/* For reasons unknown, AIX xlC compiler is the only thing that won't accept C++ style 
 * comments without specifically telling it to.
 */
#pragma options cpluscmt
#endif

// First thing we always do is include the ANTLR3 generated files, which
// will automatically include the antlr3 runtime header files.
// The compiler must use -I (or set the project settings in VS2005)
// to locate the antlr3 runtime files and -I. to find this file
//
#include    <PolyLexer.h>
#include    <PolyParser.h>
#include    <PolyPrinter.h>
#include    <PolyDifferentiator.h>
#include    <Simplifier.h>


#ifdef	WIN32
#pragma warning( disable : 4100 )
#endif

#endif

