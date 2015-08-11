(ns byticus.core
  (:require [byticus.parser]
            [byticus.commands]
            [byticus.router]
            [byticus.world])
  (:gen-class))

(defn get-input
  ([prompt] (do (print prompt) (flush) (read-line)))
  ([] (do (print ">> ") (flush) (read-line))))

(defn valid?
  [input-string]
  (let [parsed (byticus.parser/parse-vn input-string)]
    (if (nil? parsed)
      false
      parsed)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (byticus.world/populate-world)
  (println "Welcome to byticus! Type 'help' to get help.")
  (while (byticus.world/get-state :running)
    (if-let [parsed (valid? (get-input))]
      (let [verb (:verb parsed)
            nouns (:nouns parsed)]
        (byticus.router/route verb nouns))
      (println "That's not a valid command!!"))))



