/** Definition of a cyclic dfa structure such that it can be
 * instiallized at compile time and have only a single
 * runtime function that can deal with all cyclic dfa
 * structures adn show Java how it is done ;-)
 */
#ifndef	ANTLR3_CYCLICDFA_H
#define	ANTLR3_CYCLICDFA_H

#include    <antlr3baserecognizer.h>
#include    <antlr3intstream.h>

typedef struct ANTLR3_CYCLIC_DFA_struct
{
    /** Decision number that a particular static stucture
     *  represents.
     */
    const ANTLR3_INT32		decisionNumber;

    /* What this decision represents
     */
    const pANTLR3_UCHAR		description;

    ANTLR3_INT32		(*specialStateTransition)   (void * ctx, pANTLR3_BASE_RECOGNIZER recognizer, pANTLR3_INT_STREAM is, struct ANTLR3_CYCLIC_DFA_struct * dfa, ANTLR3_INT32 s);

    ANTLR3_INT32		(*specialTransition)	    (void * ctx, pANTLR3_BASE_RECOGNIZER recognizer, pANTLR3_INT_STREAM is, struct ANTLR3_CYCLIC_DFA_struct * dfa, ANTLR3_INT32 s);

    ANTLR3_INT32		(*predict)		    (void * ctx, pANTLR3_BASE_RECOGNIZER recognizer, pANTLR3_INT_STREAM is, struct ANTLR3_CYCLIC_DFA_struct * dfa);

    const ANTLR3_INT32		    * const eot;
    const ANTLR3_INT32		    * const eof;
    const ANTLR3_INT32		    * const min;
    const ANTLR3_INT32		    * const max;
    const ANTLR3_INT32		    * const accept;
    const ANTLR3_INT32		    * const special;
    const ANTLR3_INT32	    * const * const transition;

}
    ANTLR3_CYCLIC_DFA;

typedef ANTLR3_INT32		(*CDFA_SPECIAL_FUNC)   (void * , pANTLR3_BASE_RECOGNIZER , pANTLR3_INT_STREAM , struct ANTLR3_CYCLIC_DFA_struct * , ANTLR3_INT32);

#endif
