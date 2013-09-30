(define (flatten x)
  (cond ((null? x) '())
    ((not (pair? x)) (list x))
      (else (append (flatten (car x))
        (flatten (cdr x))
      )
    )
  )
)

(define (list-max l)
  (reduce (lambda (x y)
    (if (> x y) x y)) (car l) l
  )
)

(display (list-max
  (filter (lambda (x)
    (string=? (list->string (reverse (string->list (string x)))) (string x)))
    (flatten (map
      (lambda (x)
        (map (lambda (y)
          (* x y)
        ) (iota 900 100))) (iota 900 100))
      )
    )
  )
)

(exit)
