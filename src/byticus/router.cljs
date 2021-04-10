(ns byticus.router
  (:require [byticus.commands :as byt]))

(defn route
  [command nouns]
  (case command
    "help" (byt/print-help)
    "wash" (byt/wash (first nouns))
    "eat"  (byt/eat (first nouns))
    "give" (byt/give (second nouns) (first nouns))
    "go"   (byt/go (first nouns))
    "rest" (byt/sleep)
    "look" (byt/look)
    "exit" (byt/quit)
    "default"))
