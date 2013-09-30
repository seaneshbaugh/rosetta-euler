(display (reduce-left + 0 (filter (lambda (x) (or (= (modulo x 3) 0) (= (modulo x 5) 0))) (iota 999 1))))

(exit)
