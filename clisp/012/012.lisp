(defun compact-alist (alist)
  (reduce #'(lambda (result pair)
              (if (assoc (car pair) result)
                  result
                  (cons (assoc (car pair) alist) result)))
          alist :initial-value '()))

(defun prime-factors (x)
  (loop for p = 2 then (if (evenp p) (+ p 1) (+ p 2)) do
    (cond ((< x (* p p)) (return (list x)))
          ((= (rem x p) 0) (return (cons p (prime-factors (truncate x p))))))))

(defun number-of-divisors (x)
  (apply '* (map 'list
                 #'(lambda (pair) (cadr pair)) (compact-alist
                                                (reduce #'(lambda (x r)
                                                            (let ((v (assoc x r)))
                                                              (if v
                                                                  (cons (list x (+ (cadr v) 1)) r)
                                                                  (cons (list x 2) r))))
                                                        (prime-factors x) :initial-value '() :from-end t)))))

(defun find-triangle-number-with-divisors (limit)
  (let ((x 1) (tri 1))
    (loop while (<= (number-of-divisors tri) limit) do
      (setq x (+ x 1))
      (setq tri (+ tri x)) finally (return tri))))

(print (find-triangle-number-with-divisors 500))
