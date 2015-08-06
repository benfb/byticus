(ns byticus.people)

(defrecord Person [title health denarii inv])

(def player (->Person "Joe" 100 10 {}))

(def npcs
  {:oldlady (->Person "mean old lady" 5 0 {})})
