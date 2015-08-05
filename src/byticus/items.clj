(ns byticus.items)

(defrecord Item [title desc attrs])

(def items
  {:pumpkin (->Item "pumpkin" "a pretty dark pumpkin" {})})
