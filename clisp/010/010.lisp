(defun sieve-of-eratosthenes (limit)
  (labels ((sieve (prime new-limit primes integers)
    (if (> prime new-limit)
      (append (reverse (append (list prime) primes)) integers)
      (let ((new-integers (remove-if (complement #'(lambda (x) (/= (rem x prime) 0))) integers)))
        (sieve (car new-integers) new-limit (append (list prime) primes) (cdr new-integers))))))
    (sieve 2 (round (sqrt limit)) '() (loop for i from 3 to (+ limit 1) by 2 collect i))))

(print (reduce #'+ (sieve-of-eratosthenes 2000000)))
