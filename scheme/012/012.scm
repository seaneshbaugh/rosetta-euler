(define (compact-alist alist)
  (fold-left (lambda (result pair)
               (if (assv (car pair) result)
                   result
                   (cons (assv (car pair) alist) result)))
             '() alist))

(define (prime-factors x)
  (let pf ((n x) (p 2))
    (if (< n (* p p))
      (list n)
      (if (= (modulo n p) 0)
        (cons p (pf (quotient n p) p))
        (pf n (+ p 1))))))

(define (number-of-divisors x)
  (apply * (map
            (lambda (pair) (cadr pair)) (compact-alist
                                         (fold-right (lambda (x r)
                                                       (let ((v (assv x r)))
                                                         (if v
                                                             (cons (list x (+ (cadr v) 1)) r)
                                                             (cons (list x 2) r))))
                                                     '() (prime-factors x))))))

(define (triangle-number x)
  (reduce-left + 0 (iota x 1)))

(define (find-triangle-number-with-divisors limit)
  (do ((x 2 (+ x 1)) (t (triangle-number 2) (triangle-number x)))
      ((> (number-of-divisors t) limit) t)))

(display (find-triangle-number-with-divisors 500))

(exit)
