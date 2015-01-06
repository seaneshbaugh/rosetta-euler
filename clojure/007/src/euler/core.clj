(ns euler.core
  (:gen-class))

(defn sieve_of_eratosthenes
  ([limit]
    (sieve_of_eratosthenes 2 (Math/round (Math/sqrt limit)) '() (range 3 (+ limit 1) 2)))
  ([prime, limit, primes, integers]
    (if (> prime limit)
      (concat (reverse (concat (list prime) primes)) integers)
      (let [new_integers (filter #(not= (mod % prime) 0) integers)]
        (sieve_of_eratosthenes (first new_integers) limit (concat (list prime) primes) (rest new_integers))))))

(defn -main
  [& args]
  (println (let [n 10001]
    (nth (sieve_of_eratosthenes (Math/round (+ (* n (Math/log n)) (* (Math/log (Math/log n)) n)))) (- n 1)))))
