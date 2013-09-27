(defun prime_factors (x)
  (labels ((pf (n p)
    (if (< n (* p p))
      (list n)
      (if (= (rem n p) 0)
        (cons p (pf (/ n p) p))
        (pf n (+ p 1))
      )
    )))
    (pf x 2)
  )
)

(print (apply #'max (prime_factors 600851475143)))
