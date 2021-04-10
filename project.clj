(defproject byticus "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [org.clojure/clojurescript "1.9.562"]
                 [instaparse "1.4.7"]]
  :plugins [[lein-cljsbuild "1.1.6"]]
  :cljsbuild {
    :builds [{
      :source-paths ["src"]
      :compiler {
        :output-to "resources/public/js/main.js"
        :optimizations :advanced
        :pretty-print true}}]}
  :main ^:skip-aot byticus.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
