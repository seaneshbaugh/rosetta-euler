(defun prime-factors (x)
  (labels ((pf (n p)
    (if (< n (* p p))
      (list n)
      (if (= (rem n p) 0)
        (cons p (pf (/ n p) p))
        (pf n (+ p 1))))))
    (pf x 2)))

(defun delete-first (i l)
  (cond
    ((null l)
      '())
    ((= i (car l))
      (cdr l))
    (t
      (cons (car l) (delete-first i (cdr l))))))

(defun overlap (a b)
  (sort (append a (labels ((o (x y)
    (if (null x)
      y
      (o (cdr x) (delete-first (car x) y)))))
    (o a b))) #'<))

(print
  (reduce #'*
    (reduce  #'overlap
      (loop for i from 1 to 20
        collect (prime-factors i)))))
