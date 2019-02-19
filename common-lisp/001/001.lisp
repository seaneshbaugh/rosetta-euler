(print (reduce #'+
    (remove-if #'(lambda (X)
      (and (/= (rem x 3) 0) (/= (rem x 5) 0)))
      (loop for n from 1 below 1000 by 1 collect n))))
