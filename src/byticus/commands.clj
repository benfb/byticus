(ns byticus.commands
  (:require [byticus.world :as w]
            [clojure.string :as str :refer [trim]]))

(defn print-help
  []
  (println (str/trim (slurp "resources/help.txt"))))

(defn quit
  []
  (w/update-state :running false)
  (println "Goodbye!"))

(defn sleep
  []
  (let [health-gained (rand-int 5)
        health (w/get-player :health)]
    (w/update-player :health (+ health-gained health)))
  (println "You rest. Your health is now" (w/get-player :health)))

(defn look
  []
  (let [loc (w/get-state :active-room)
        items (map name (keys (:items loc)))
        npcs (map :title (map w/get-npcs (keys (:people loc))))
        exits (:exits loc)
        names (map name (keys exits))
        descs (map :desc (map #(w/get-rooms (% exits)) (keys exits)))]
    (println (:desc loc))
    (when (pos? (count items))
      (apply println (map #(str "There is a " %1 " in the room.") items)))
    (when (pos? (count npcs))
      (apply println (map #(str "There is a " %1 " in the room.") npcs)))
    (println "Exits:")
    (apply println (map #(str "To the " %1 " is " %2 ".\n") names descs))))

(defn go
  [direction]
  (let [key-direction (keyword direction)
        new-location (key-direction (:exits (w/get-state :active-room)))]
    (if-not (nil? new-location)
      (do (w/update-state :active-room (w/get-rooms new-location))
        (look))
      (println "You can't go that way!"))))

(defn eat
  [obj]
  (if (= obj "me") (println "No, sicko") (println "You ate the" obj)))

(defn wash
  [obj]
  (println "you wash the" obj))

(defn give
  [obj dest]
  (let [item-key (keyword obj)
        item (w/get-items item-key)
        inv (w/get-player :inv)
        npc-key (keyword dest)]
    (w/update-player :inv (dissoc inv item-key))
    (w/update-npc npc-key :inv (dissoc item (w/get-npc npc-key :inv))))
  (println "You give the" obj "to the" dest))
