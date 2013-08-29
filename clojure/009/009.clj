(defn pythagorean_triple_with_sum
  ([sum]
    (loop [m 2 n 1]
      (if (and (and (< m sum) (< n (- sum 1))) (> m n))
        (let [a (- (* m m) (* n n)) b (* 2 m n) c (+ (* m m) (* n n))]
          (if (and (= (+ a b c) sum) (= (+ (* a a) (* b b)) (* c c)))
            (list a b c)
            (recur m (+ n 1))
          )
        )
        (if (and (< m sum) (< n (- sum 1)))
          (recur (+ 1 m) 1)
          '()
        )
      )
    )
  )
)

(println (apply * (pythagorean_triple_with_sum 1000)))
