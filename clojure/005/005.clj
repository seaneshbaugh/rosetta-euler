(defn remove_first
  ([x, coll]
    (let [[n m] (split-with #(not= x %) coll)]
      (concat n (rest m))
    )
  )
)

(defn find_first
  ([pred, coll]
    (first (filter pred coll))
  )
)

(defn overlap
  ([a, b]
    (let [duplicates_removed
      (loop [x a y b]
        (if (empty? x)
          y
          (recur (rest x) (remove_first (first x) y))
        )
      )]
      (sort (concat a duplicates_removed))
    )
  )
)

(defn prime_factors
  ([x]
    (let [v (find_first #(= (mod x %) 0) (range 2 x))]
      (if (= v nil)
        (list x)
        (concat (list v) (prime_factors (/ x v)))
      )
    )
  )
)

(println (reduce *
  (let [prime_factor_lists
    (map #(prime_factors %) (range 1 21))]
      (loop [remaining_prime_factor_lists prime_factor_lists factors '()]
        (if (empty? remaining_prime_factor_lists)
          factors
          (recur (rest remaining_prime_factor_lists) (overlap factors (first remaining_prime_factor_lists)))
        )
      )
    )
  )
)
