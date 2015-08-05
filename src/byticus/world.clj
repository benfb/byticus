(ns byticus.world
  (:require [byticus.rooms :refer [rooms]]
            [byticus.items :refer [items]]
            [byticus.npcs :refer [npcs]]))

(defrecord Player [title health denarii location inventory])

(defrecord Enemy [title health strength location inventory])

(def world-state (atom {
  :rooms rooms
  :items items
  :npcs npcs
  :player (->Player "Joe" 100 10 (:hallway rooms) #{})}))

(defn get-state [key]
  (@world-state key))

(defn update-state [key val]
  (swap! world-state assoc key val))

(defn get-player [key]
  (key (get-state :player)))

(defn update-player [key val]
  (update-state :player (assoc (get-state :player) key val)))

(defn get-npc [title]
  (title (get-state :npcs)))

(defn update-player [key val]
  (update-state :player (assoc (get-state :player) key val)))

(defn get-room [key]
  (key (get-state :rooms)))

(defn get-item [key]
  (key (get-state :items)))

(defn move-item [title obj1 obj2]
  (let [item (get-item (key title))]
    (update-player (get-state :items))))
