(defun fibs_less_than (x)
  (labels ((flt (fibs)
    (if (> (+ (first fibs) (second fibs)) x)
      fibs
      (flt (cons (+ (first fibs) (second fibs)) fibs))
    )))
    (flt '(1 0))
  )
)

(print (reduce #'+ (remove-if #'(lambda (x) (/= (rem x 2) 0)) (fibs_less_than 4000000))))
