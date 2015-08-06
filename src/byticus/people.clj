(ns byticus.people)

(defrecord Player [title health denarii inv])

(defrecord NPC [title health denarii inv])

(def player (->Player "Joe" 100 10 {}))

(def npcs
  {:oldlady (->NPC "mean old lady" 5 0 {})})
