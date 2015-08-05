(ns byticus.npcs)

(defrecord NPC [title health denarii location inventory])

(def npcs
  {:old_lady (->NPC "a mean old lady" 5 0 {} #{})})
