(print
  (apply #'max (remove-if (complement #'(lambda (n) (string= (write-to-string n) (reverse (write-to-string n)))))
    (apply #'append (loop for x from 100 to 999
      collect (loop for y from 100 to 999
        collect (* x y)))))))
