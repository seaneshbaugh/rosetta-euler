(ns euler.core
  (:gen-class))

(defn prime_factors
  ([x]
    (loop [n x p 2 a '()]
      (if (< n (* p p))
        (cons n a)
        (if (= (mod n p) 0)
          (recur (quot n p) p (cons p a))
          (recur n (+ p 1) a))))))

(defn -main
  [& args]
  (println (apply max (prime_factors 600851475143))))
