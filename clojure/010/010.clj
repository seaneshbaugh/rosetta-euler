(defn sieve_of_eratosthenes
  ([limit]
    (sieve_of_eratosthenes 2 (Math/round (Math/sqrt limit)) '() (range 3 (+ limit 1) 2))
  )
  ([prime, limit, primes, integers]
    (if (> prime limit)
      (concat (reverse (concat (list prime) primes)) integers)
      (let [new_integers (filter #(not= (mod % prime) 0) integers)]
        (sieve_of_eratosthenes (first new_integers) limit (concat (list prime) primes) (rest new_integers))
      )
    )
  )
)

(println (apply + (sieve_of_eratosthenes 2000000)))
