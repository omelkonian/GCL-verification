open HolKernel boolLib bossLib Parse;

val _ = new_theory"test";

(* SML declarations  *)
(* for example: *)
val th = save_thm("SKOLEM_AGAIN",SKOLEM_THM);

val _ = export_theory();
