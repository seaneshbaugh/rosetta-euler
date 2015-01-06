(ns euler.core
  (:gen-class))

(defn -main
  [& args]
  (println (- (Math/round (Math/pow (reduce + (range 1 101)) 2)) (reduce + (map #(* % %) (range 1 101))))))
