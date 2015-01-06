(ns euler.core
  (:gen-class))

(defn -main
  [& args]
  (println (apply max
    (filter (fn [x]
      (= (str x) (apply str (reverse (str x)))))
      (flatten (map (fn [x] (map (fn [y] (* x y)) (range 100 999))) (range 100 999)))))))
