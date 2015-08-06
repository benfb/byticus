(ns byticus.commands
  (:require [byticus.world :as w]
            [clojure.string :as str :refer [trim]]))

(defn print-help
  []
  (println (str/trim (slurp "resources/help.txt"))))

(defn sleep
  []
  (let [health-gained (rand-int 5)
        health (w/get-player :health)]
    (w/update-player :health (+ health-gained health)))
  (println "You rest. Your health is now" (w/get-player :health)))

(defn look
  []
  (let [loc (w/get-state :active-room)
        exits (:exits loc)
        names (map name (keys exits))
        descs (map :desc (map #(w/get-rooms (% exits)) (keys exits)))]
    (println (:desc loc))
    (println "Exits:")
    (println (map #(str "To the " %1 " is " %2 ",") names descs))))

(defn go
  [direction]
  (let [key-direction (keyword direction)
        new-location (key-direction (:exits (w/get-state :active-room)))]
    (w/update-state :active-room (w/get-rooms new-location)))
  (println "You went" direction".")
  (look))

(defn eat
  [obj]
  (if (= obj "me") (println "No, sicko") (println "You ate the" obj)))

(defn wash
  [obj]
  (println "you wash the" obj))

(defn give
  [obj dest]
  (println "You give the" obj "to the" dest))
