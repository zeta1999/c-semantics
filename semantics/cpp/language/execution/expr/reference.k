module CPP-EXECUTION-EXPR-REFERENCE-SYNTAX
     imports SYMLOC-SORTS

     syntax KItem ::= deleteReference(SymLoc)

endmodule

module CPP-EXECUTION-EXPR-REFERENCE
     imports CPP-EXECUTION-EXPR-REFERENCE-SYNTAX
     imports C-CONFIGURATION
     imports BOOL
     imports CPP-BITSIZE-SYNTAX
     imports CPP-DYNAMIC-SYNTAX
     imports CPP-MEMORY-ALLOC-SYNTAX
     imports CPP-REFERENCE-SYNTAX
     imports CPP-SYMLOC-SYNTAX
     imports CPP-SYNTAX
     imports CPP-TYPING-SYNTAX

     rule bindReferenceExec(E1::Expr, E2::Expr)
          => bindReferenceExec2(E1, E2)

     syntax Expr ::= bindReferenceExec2(Expr, Expr) [strict(c; 2)]

     // we need this result tag because lvalues of reference type aren't KResults
     // In Translation(), the unreference rewrite might apply,
     // so we restrict this context to Execution().
     context bindReferenceExec2(HOLE:Expr, _)
          requires Execution() [result(LVal)]

     rule <k> bindReferenceExec2(
               lv(Loc1::SymLoc, _, T1::CPPType) #as L1::LVal,
               lv(Loc2::SymLoc, _, T2::CPPType) #Or
               xv(Loc2::SymLoc, _, T2::CPPType) #Or
               prv(Loc2:SymLoc, _, T2::CPPType)
          )
          =>
          referenceBindingResult(L1)
          ...</k>
          <references>...
          .Map => stripProv(Loc1) |-> referenceTarget(innerType(T1), Loc2, T2)
          ...</references>

     syntax SymLoc ::= referenceTarget(t1: CPPType, loc: SymLoc, t2: CPPType) [function]

     rule referenceTarget(t(... st: classType(...)) #as T1::CPPType, Loc::SymLoc, t(... st: classType(...)) #as T2::CPPType)
          => baseClassSubobject(Loc, T1, T2)
          requires isBaseClassOf(T1, T2)

     rule referenceTarget(... loc: Loc::SymLoc) => Loc [owise]

     rule <k> deleteReference(Loc::SymLoc) => .K ...</k>
     <references> R::Map => R[stripProv(Loc) <- undef] </references>

endmodule
