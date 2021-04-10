(ns byticus.core
  (:require [byticus.parser]
            [byticus.commands]
            [byticus.router]
            [byticus.world]))

(defn get-input
  ([prompt] (do (print prompt) (flush) (read-line)))
  ([] (do (print ">> ") (flush) (read-line))))

(defn valid?
  [input-string]
  (if-let [parsed (byticus.parser/parse-vn input-string)]
     parsed
     false))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (byticus.world/populate-world)
  (println "Welcome to byticus! Type 'help' to get help.")
  (while (byticus.world/running?)
    (if-let [parsed (valid? (get-input))]
      (byticus.router/route (:verb parsed) (:nouns parsed))
      (println "That's not a valid command!!"))))



