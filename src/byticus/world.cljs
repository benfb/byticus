(ns byticus.world
  (:require [byticus.rooms :refer [rooms]]
            [byticus.items :refer [items]]
            [byticus.people :refer [player npcs]]))

(def world-state (atom {
  :rooms rooms
  :items items
  :npcs npcs
  :player player
  :active-room (:hallway rooms)
  :running true}))

(defn get-state [key]
  (@world-state key))

(defn update-state [key val]
  (swap! world-state assoc key val))

(defn running? []
  (get-state :running))

;; People

(defn get-player [player-key]
  (player-key (get-state :player)))

(defn update-player [key val]
  (update-state :player (assoc (get-state :player) key val)))

(defn get-npcs [npc]
  (npc (get-state :npcs)))

(defn update-npcs [npc new-npc]
  (let [new-npcs (assoc (get-state :npcs) npc new-npc)]
    (update-state :npcs new-npcs)))

(defn get-npc [npc npc-key]
  (npc-key (get-npcs npc)))

(defn update-npc [npc key val]
  (let [npc-obj (get-npcs npc)
        new-npc (assoc npc-obj key val)]
    (update-npcs npc new-npc)))

;; Rooms

(defn get-rooms [room]
  (room (get-state :rooms)))

(defn update-rooms [room new-room]
  (let [new-rooms (assoc (get-state :rooms) room new-room)]
    (update-state :rooms new-rooms)))

(defn get-room [room room-key]
  (room-key (get-rooms room)))

(defn update-room [room key val]
  (let [room-obj (get-rooms room)
        new-room (assoc room-obj key val)]
    (update-rooms room new-room)))

;; Items

(defn get-items [item]
  (item (get-state :items)))

(defn update-items [item new-item]
  (let [new-items (assoc (get-state :items) item new-item)]
    (update-state :items new-items)))

(defn get-item [item item-key]
  (item-key (get-items item)))

(defn populate-world []
  (update-player :inv {:baseball (get-items :baseball)})
  (update-room :bar :people (conj (get-room :bar :people) {:oldlady (get-npcs :oldlady)}))
  (update-room :wall :items (conj (get-room :wall :items) {:baseball (get-items :baseball)}))
  (update-room :wall :items (conj (get-room :wall :items) {:pumpkin (get-items :pumpkin)})))
