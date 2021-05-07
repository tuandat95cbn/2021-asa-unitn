;; problem file: blocks-problem1.pddl
(define (problem blocksworld-prob1)
  (:domain blocksworld)
  (:objects a b c d e f)
  (:init (on b a) (on-table a)(on c d)(on-table d)(on-table e)(on-table f) (clear b)(clear c)(clear e)(clear f) )
  (:goal (and (on a b)(on b c)(on c d)(on d e)(on e f)))
  )

