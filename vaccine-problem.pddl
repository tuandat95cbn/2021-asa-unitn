(define (problem vaccine-prob)
    (:domain vaccine-domain)
    (:objects
        vn no bn td bn-tp qv yp ts tt plane truck-1 truck-2 drone-1 drone-2 drone-3 vaccine-box-1 vaccine-box-2 vaccine-box-3 vaccine-box-4 vaccine-box-5 vaccine-box-6
    )

    (:init
        (state vn)(location vn)
        (region no)(location no)
        (provice bn)(location bn)
        (district td)(location td)
        (district bn-tp)(location bn-tp)
        (district qv)(location qv)
        (district yp)(location yp)
        (district ts)(location ts)
        (district tt)(location tt)
        (connected vn no)
        (connected no vn)
        (connected no bn)
        (connected bn no)
        (connected td bn)
        (connected bn-tp bn)
        (connected qv bn)
        (connected yp bn)
        (connected ts bn)
        (connected tt bn)
        (connected bn td)
        (connected bn bn-tp)
        (connected bn qv)
        (connected bn yp)
        (connected bn ts)
        (connected bn tt)
        (has-ariport vn)
        (has-ariport no)
        (plane plane)(vehicle plane)
        (truck truck-1)(vehicle truck-1)
        (truck truck-2)(vehicle truck-2)
        (drone drone-1)(vehicle drone-1)
        (drone drone-2)(vehicle drone-2)
        (drone drone-3)
        (vehicle drone-3)
        (vaccine-box vaccine-box-1)
        (vaccine-box vaccine-box-2)
        (vaccine-box vaccine-box-3)
        (vaccine-box vaccine-box-4)
        (vaccine-box vaccine-box-5)
        (vaccine-box vaccine-box-6)
        (at vaccine-box-1 vn)
        (at vaccine-box-2 vn)
        (at vaccine-box-3 vn)
        (at vaccine-box-4 vn)
        (at vaccine-box-5 vn)
        (at vaccine-box-6 vn)
        (at plane vn)
        (at truck-1 vn)
        (at truck-2 vn)
        (at drone-1 bn)
        (at drone-2 bn)
        (at drone-3 bn)
        (= (capacity plane) 0)
        (= (capacity truck-1) 0)
        (= (capacity truck-2) 0)
        (= (capacity drone-1) 0)
        (= (capacity drone-2) 0)
        (= (capacity drone-3) 0)
        (= (capacity td) 0)
        (= (capacity bn-tp) 0)
        (= (capacity qv) 0)
        (= (capacity yp) 0)
        (= (capacity ts) 0)
        (= (capacity tt) 0)
        (= (capacity vn) 7)
        (= (capacity no) 0)
        (= (capacity bn) 0)
    )

    (:goal
        (and
            ;(at plane no)
            (>= (capacity td) 1)
            (>= (capacity td) 1)
            (>= (capacity bn-tp) 1)
            (>= (capacity qv) 1)
            (>= (capacity yp) 1)
            (>= (capacity ts) 1)
            (>= (capacity tt) 1)
        )
    )
)