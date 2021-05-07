;; domain file: rocket-domain.pddl
(define (domain rocket-domain)
	(:requirements :strips :fluents)
	(:predicates
		(person ?p)
		(rocket ?r)
		(location ?l)
		(at ?t ?l)
		(in ?c ?r)
		(has-fuel ?r)
	)
	(:functions
		(capacity ?r)
	)
	(:action load
		:parameters (?r ?c ?l)
		:precondition (and (rocket ?r) (person ?c) (location ?l) (at ?r ?l) (at ?c ?l) (has-fuel ?r)(< (capacity ?r) 1))
		:effect (and (not (at ?c ?l)) (in ?c ?r) (increase (capacity ?r) 1))
	)

	(:action re-fuel
		:parameters (?r)
		:precondition (and (rocket ?r) )
		:effect (and (has-fuel ?r))
	)
	(:action un-load
		:parameters (?r ?c ?l)
		:precondition (and (rocket ?r) (person ?c) (location ?l) (at ?r ?l) (in ?c ?r))
		:effect (and (at ?c ?l) (not (in ?c ?r)) (decrease (capacity ?r) 1))
	)
	(:action fly
		:parameters (?r ?l-1 ?l-2)
		:precondition (and (rocket ?r) (location ?l-1) (location ?l-2) (at ?r ?l-1) (has-fuel ?r))
		:effect (and (not (at ?r ?l-1)) (at ?r ?l-2) (not(has-fuel ?r))
		)
	)
)