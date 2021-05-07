(define (problem rrt6)
  (:domain rockets-2)
  (:objects venus earth mars moon r1 r2 r3 r4
	    anna beth carol diane emma)
  (:init
   (= (capacity r1) 0) (= (capacity r2) 0)
   (= (capacity r3) 0) (= (capacity r4) 0)

   (location venus) (location earth) (location mars) (location moon)
   (rocket r1) (rocket r2) (rocket r3) (rocket r4) (person anna)
   (person beth) (person carol) (person diane) (person emma)
   (at r1 venus) (at r2 earth) (at r3 mars) (at r4 moon)
   (at anna venus) (at beth venus) (at carol earth)
   (at diane mars) (at emma moon)
   (has-fuel r1) (has-fuel r2) (has-fuel r3) (has-fuel r4))
  (:goal (and (at anna earth) (at carol mars) (at beth moon)
	      (at diane moon) (at emma earth)))
  )
