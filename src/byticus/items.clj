(ns byticus.items)

(defrecord Item [title desc attributes])

(def items
  {:pumpkin (->Item "pumpkin" "a pretty dark pumpkin" {})
   :baseball (->Item "baseball" "a damn fine baseball" {})})
