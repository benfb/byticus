(ns byticus.core
  (:require [byticus.parser :as parse]
            [byticus.commands :as byt]
            [byticus.world :as w])
  (:gen-class))

(defn get-input
  ([prompt] (do (print prompt) (flush) (read-line)))
  ([] (do (print ">> ") (flush) (read-line))))

(defn router
  [command nouns]
  (case command
    "help" (byt/print-help)
    "wash" (byt/wash (first nouns))
    "eat"  (byt/eat (first nouns))
    "give" (byt/give (second nouns) (first nouns))
    "go"   (byt/go (first nouns))
    "rest" (byt/sleep)
    "look" (byt/look)
    "default"))

(defn valid?
  [input-string]
  (if (nil? (byticus.parser/parse-vn input-string))
    false
    true))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (w/populate-world)
  (println "Welcome to byticus! Type 'help' to get help.")
  (while true
    (let [input (get-input)]
      (if (valid? input)
        (let [parsed (byticus.parser/parse-vn input)
              verb (:verb parsed)
              nouns (:nouns parsed)]
          (router verb nouns))
        (println "That's not a valid command!!")))))



