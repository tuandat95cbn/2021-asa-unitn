;; Rockets domain: A logistic-like domain.  However, rockets can only
;; fly once (they run out of fuel). Here we rockets can be
;; refueled. In some problems some passengers have to transit several
;; times to get to their destination.

(define (domain rockets-2)
  (:requirements :strips  :fluents)
  (:predicates (person ?x) (rocket ?x) (location ?x)
	       (at ?t ?l) (in ?c ?r) (has-fuel ?r)
	       (capacity ?r ?n))
  (:functions (capacity ?r))
  (:action load
	   :parameters (?c ?r ?l)
	   :precondition (and (person ?c) (rocket ?r) (location ?l)
			      (at ?c ?l) (at ?r ?l) (< (capacity ?r) 2))
	   :effect (and (not (at ?c ?l)) (in ?c ?r) (increase (capacity ?r) 1)))

  (:action unload
	   :parameters (?c ?r ?l)
	   :precondition (and (person ?c) (rocket ?r) (location ?l)
			      (in ?c ?r) (at ?r ?l) (> (capacity ?r) 0))
	   :effect (and (not (in ?c ?r)) (at ?c ?l) (decrease (capacity ?r) 1)))

  (:action fly
	   :parameters (?r ?dep ?dst)
	   :precondition (and (rocket ?r) (location ?dep) (location ?dst)
			      (at ?r ?dep) (has-fuel ?r))
	   :effect (and (not (at ?r ?dep)) (at ?r ?dst) (not (has-fuel ?r))))

  (:action refuel
	   :parameters (?r)
	   :precondition (and (rocket ?r) (not (has-fuel ?r)))
	   :effect (and (has-fuel ?r)))
  )
