(define (problem rocket-prob-capacity)
	(:domain rocket-domain)
	(:objects
		earth mars male female space-x
	)
	(:init
		(location earth)(location mars)
		(person male)(person female)
		(rocket space-x)
		(at male earth)
		(at female earth)
		(at space-x earth)
		(has-fuel space-x)
		(=(capacity space-x) 0)
	)
	(:goal

		(and (at male mars) (at female mars))
	)
)