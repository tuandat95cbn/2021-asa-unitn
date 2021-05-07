;; domain file: blocksworld-domain-complete.pddl
(define (domain hanoi-tower)
	(:requirements :strips)
	(:predicates
		(on ?d-1 ?d-2)
		(smaller ?d-1 ?d-2)
		(clear ?x)
	)
	(:action move
		:parameters (?d ?f ?t)
		:precondition (and (on ?d ?f) (clear ?t) (clear ?d) (smaller ?d ?f) (smaller ?d ?t))
		:effect (and (not (clear ?t)) (clear ?f) (not(on ?d ?f)) (on ?d ?t)
		)
	)
)