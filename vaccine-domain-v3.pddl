;; domain file: vaccine-domain.pddl
(define (domain vaccine-domain-v3)
	(:requirements :strips :fluents)
	(:predicates
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

	)
	(:functions
		(capacity ?v)
	)
	(:action load
		:parameters (?vehicle ?location)
		:precondition (and
			(location ?location)
			(at ?vehicle ?location)
			(> (capacity ?location) 0)
			(or (and
					(plane ?vehicle)
					(< (capacity ?vehicle) 5)
				)
				(and
					(truck ?vehicle)
					(< (capacity ?vehicle) 3)
				)
				(and
					(drone ?vehicle)
					(< (capacity ?vehicle) 1)
				)
			)
		)
		:effect (and 
			(increase (capacity ?vehicle) 1)
			(decrease (capacity ?location) 1))
	)
	(:action un-load
		:parameters (?vehicle  ?location)
		:precondition (and (vehicle ?vehicle)
			(location ?location)
			(at ?vehicle ?location)
			(> (capacity ?vehicle) 0))
		:effect (and 
			(decrease (capacity ?vehicle) 1)
			(increase (capacity ?location) 1))
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
						;;(district ?location-2)
						;;(district ?location-1)
						(and (district ?location-2) (inside ?location-2 ?location-1))
						(and (district ?location-1) (inside ?location-1 ?location-2))
					)
					;(connected ?location-1 ?location-2)
				)
			)
		)
		:effect (and (not (at ?vehicle ?location-1)) (at ?vehicle ?location-2))
	)
)