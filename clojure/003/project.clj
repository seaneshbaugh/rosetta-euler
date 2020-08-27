(defproject euler "0.0.1"
  :description "Project Euler #3 - Clojure"
  :url "https://github.com/seaneshbaugh/rosetta-euler/tree/master/clojure/003"
  :dependencies [[org.clojure/clojure "1.10.1"]]
  :main ^:skip-aot euler.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
