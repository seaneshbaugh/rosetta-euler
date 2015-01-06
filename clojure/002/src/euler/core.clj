(ns euler.core
  (:gen-class))

(defn fibs_less_than
  ([x]
    (fibs_less_than x '(1 0)))
    ([x, fibs]
      (if (> (+ (first fibs) (second fibs)) x)
      fibs
      (fibs_less_than x (conj fibs (+ (first fibs) (second fibs)))))))

(defn -main
  [& args]
  (println (apply + (filter (fn [x] (= (mod x 2) 0)) (fibs_less_than 4000000)))))
