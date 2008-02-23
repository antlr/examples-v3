#ifndef	_SYMBOLPP_H
#define	_SYMBOLPP_H

// A simple demonstration class purely to show that the C target
// output is C++ compilable. Note that this is the output files that
// can be compiled as C++, not the runtime library code itself, which
// is purest C, though it has very few things that are incompatible. There is
// however no need for the C runtime library to be compiled as C++, as it
// just links in trivially as a library on any system, which is more than 
// can be said for C++ ;_). 
//
// Later the C output may be extended to give some nice convenience classes
// for C++ people. For now though, use C for interactions and instantiate your
// own classes and so on.
//
#ifdef __cplusplus
class symbolpp
{
public:

	symbolpp(int aline, pANTLR3_STRING aname)
	{
		line	= aline;
		name	= aname;
		printf("Created a symbolpp class\n");
	} 

private:

	pANTLR3_STRING	name;
	int				line;

public:

	inline int getLine()
	{
		return	line;
	}

	inline const char * getName()
	{
		return (const char *)(name->chars);
	}

};
#endif

#endif

