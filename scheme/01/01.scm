(define (euler1 n)
  (if (= n 0)
    (list 0)
    (if (or (= (modulo n 3) 0) (= (modulo n 5) 0))
      (cons n (euler1 (- n 1)))
      (euler1 (- n 1)))))

(display (apply + (euler1 999)))

(quit)
