(print
  (-
    (expt (reduce #'+
      (loop for i from 1 to 100
        collect i)) 2)
    (reduce #'+
      (loop for i from 1 to 100
        collect (* i i)))))
