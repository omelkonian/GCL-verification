signature testTheory =
sig
  type thm = Thm.thm

  (*  Theorems  *)
    val SKOLEM_AGAIN : thm

  val test_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "test"

   [patternMatches] Parent theory of "test"

   [SKOLEM_AGAIN]  Theorem

      |- ∀P. (∀x. ∃y. P x y) ⇔ ∃f. ∀x. P x (f x)


*)
end
