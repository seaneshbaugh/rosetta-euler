(display (- (expt (reduce-left + 0 (iota 100 1)) 2) (reduce-left + 0 (map (lambda (x) (* x x)) (iota 100 1)))))

(exit)
