structure testTheory :> testTheory =
struct

  val _ = if !Globals.print_thy_loads
    then TextIO.print "Loading testTheory ... "
    else ()

  open Type Term Thm
  local open indexedListsTheory patternMatchesTheory in end;

  structure TDB = struct
    val thydata = 
      TheoryReader.load_thydata "test"
        (holpathdb.subst_pathvars "/home/orestis/Dropbox/UU/PSV/HOL/src/Test/testTheory.dat")
    fun find s = Redblackmap.find (thydata,s)
  end

  fun op SKOLEM_AGAIN _ = () val op SKOLEM_AGAIN = TDB.find "SKOLEM_AGAIN"

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val test_grammars = merge_grammars ["indexedLists", "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="test"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val test_grammars = 
    Portable.## (addtyUDs,addtmUDs) test_grammars
  val _ = Parse.grammarDB_insert("test",test_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "test"

end
