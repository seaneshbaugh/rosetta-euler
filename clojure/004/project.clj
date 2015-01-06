(defproject euler "0.0.1"
  :description "Project Euler #4 - Clojure"
  :url "https://github.com/seaneshbaugh/rosetta-euler/tree/master/clojure/004"
  :dependencies [[org.clojure/clojure "1.6.0"]]
  :main ^:skip-aot euler.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
