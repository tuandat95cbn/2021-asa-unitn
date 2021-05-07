(define (problem hanoi-tower-prob)
	(:domain hanoi-tower)
	(:objects
		pillar-1 pillar-2 pillar-3 disk-1 disk-2 disk-3
	)
	(:init
		(smaller disk-1 pillar-1)(smaller disk-2 pillar-1)(smaller disk-3 pillar-1)
		(smaller disk-1 pillar-2)(smaller disk-2 pillar-2)(smaller disk-3 pillar-2)
		(smaller disk-1 pillar-3)(smaller disk-2 pillar-3)(smaller disk-3 pillar-3)
		(smaller disk-1 disk-2)(smaller disk-1 disk-3)(smaller disk-2 disk-3)
		(on disk-1 disk-2)(on disk-2 disk-3)(on disk-3 pillar-1)
		(clear disk-1)
		(clear pillar-2)
		(clear pillar-3)
	)

	(:goal
		(or
			(and (on disk-1 disk-2)(on disk-2 disk-3)(on disk-3 pillar-2))
			(and (on disk-1 disk-2)(on disk-2 disk-3)(on disk-3 pillar-3))
		)
	)
)