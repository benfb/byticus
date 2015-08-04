(ns byticus.commands
  (:require [byticus.state :as state]
            [clojure.string :as str :refer [trim]]))

(defn print-help
  []
  (println (str/trim (slurp "resources/help.txt"))))

(defn sleep
  []
  (let [health-gained (rand-int 5)
        health (state/get-player :health)]
    (state/update-player :health (+ health-gained health)))
  (println "You rest. Your health is now" (state/get-player :health)))

(defn look
  []
  (let [loc (state/get-player :location)]
    (println (:desc loc))
    (println "Exits:" (apply name (keys (:exits loc))))))

(defn go
  [direction]
  (let [key-direction (keyword direction)
        new-location (key-direction (:exits (state/get-player :location)))]
    (state/update-player :location (state/get-room new-location)))
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