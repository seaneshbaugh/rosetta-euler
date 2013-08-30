(define (fibs_less_than x)
  (let flt ((fibs '(1 0)))
    (if (> (+ (first fibs) (second fibs)) x)
      fibs
      (flt (cons (+ (first fibs) (second fibs)) fibs))
    )
  )
)

(display (apply + (filter (lambda (x) (= (modulo x 2) 0)) (fibs_less_than 4000000))))

(exit)
