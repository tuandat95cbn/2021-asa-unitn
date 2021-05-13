;; domain file: vaccine-domain.pddl
;; This version use constants
(define (domain vaccine-domain-v22)
	(:requirements :strips :fluents)
	(:predicates
		(vaccine-box ?v)
		(vehicle ?v)
		(truck ?t)
		(location ?l)
		(plane ?p)
		(drone ?d)
		(state ?l)
		(region ?l)
		(province ?l)
		(district ?l)
		(has-airport ?l)
		(in ?b ?v)
		(at ?v ?l)
		(connected ?l-1 ?l-2)
		(inside ?l-1 ?l-2)
		(capacity ?r ?n)

	)
	(:constants
		l0 l1 l2 l3
	)
	(:action load
		:parameters (?vehicle ?vaccine-box ?location)
		:precondition (and
			(vaccine-box ?vaccine-box)
			(location ?location)
			(at ?vehicle ?location)
			(at ?vaccine-box ?location)
			(or (and
					(plane ?vehicle)
					(or (capacity ?vehicle l0)(capacity ?vehicle l1)(capacity ?vehicle l2)
					)
				)
				(and
					(truck ?vehicle)
					(or (capacity ?vehicle l0)(capacity ?vehicle l1)
					)
				)
				(and
					(drone ?vehicle)
					(capacity ?vehicle l0)
				)
			)
		)

		:effect (and (not (at ?vaccine-box ?location))
			(in ?vaccine-box ?vehicle)
			(when
				(capacity ?vehicle l0)
				(capacity ?vehicle l1))
			(when
				(capacity ?vehicle l1)
				(capacity ?vehicle l2))
			(when
				(capacity ?vehicle l2)
				(capacity ?vehicle l3))
		)
	)
	(:action un-load
		:parameters (?vehicle ?vaccine-box ?location)
		:precondition (and (vehicle ?vehicle)
			(vaccine-box ?vaccine-box)
			(location ?location)
			(at ?vehicle ?location)
			(in ?vaccine-box ?vehicle)

			(or (capacity ?vehicle l3)(capacity ?vehicle l1)(capacity ?vehicle l2)))
		:effect (and (at ?vaccine-box ?location)
			(not (in ?vaccine-box ?vehicle))
			(when
				(capacity ?vehicle l1)
				(capacity ?vehicle l0))
			(when
				(capacity ?vehicle l2)
				(capacity ?vehicle l1))
			(when
				(capacity ?vehicle l3)
				(capacity ?vehicle l2))
		)
	)
	(:action move
		:parameters (?vehicle ?location-1 ?location-2)
		:precondition (and
			(location ?location-1)
			(location ?location-2)
			(at ?vehicle ?location-1)
			(or (and
					(plane ?vehicle)
					(has-airport ?location-1)
					(has-airport ?location-2)
				)
				(and
					(truck ?vehicle)
					(connected ?location-1 ?location-2)
					(not(district ?location-2))
				)
				(and
					(drone ?vehicle)
					(or
						(and (district ?location-2) (inside ?location-2 ?location-1))
						(and (district ?location-1) (inside ?location-1 ?location-2))
						;(district ?location-2)
						;(district ?location-1)
					)
					;(connected ?location-1 ?location-2)
				)
			)
		)
		:effect (and (not (at ?vehicle ?location-1)) (at ?vehicle ?location-2))
	)
)