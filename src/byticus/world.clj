(ns byticus.world
  (:require [byticus.rooms :refer [rooms]]
            [byticus.items :refer [items]]
            [byticus.people :refer [player npcs]]))

(def world-state (atom {
  :rooms rooms
  :items items
  :npcs npcs
  :player player
  :active-room (:hallway rooms)}))

(defn get-state [key]
  (@world-state key))

(defn update-state [key val]
  (swap! world-state assoc key val))


;; People

(defn get-player [key]
  (key (get-state :player)))

(defn update-player [key val]
  (update-state :player (assoc (get-state :player) key val)))

(defn get-npcs [npc]
  (npc (get-state :npcs)))

(defn update-npcs [npc new-npc]
  (let [new-npcs (assoc (get-state :npcs) npc new-npc)]
    (update-state :npcs new-npcs)))

(defn get-npc [npc key]
  (key (get-npcs npc)))

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

(defn get-room [room key]
  (key (get-rooms room)))

(defn update-room [room key val]
  (let [room-obj (get-rooms room)
        new-room (assoc room-obj key val)]
    (update-rooms room new-room)))

;; Items

(defn get-item [item]
  (item (get-state :items)))

(defn move-item [title obj1 obj2]
  (let [item (get-item (key title))]
    (update-player (get-state :items))))

(defn populate-world []
  (update-room :hallway :people (get-npcs :oldlady))
  (update-npc :oldlady :inv (get-item :pumpkin))
  (update-npc :oldlady :inv (conj (get-npc :oldlady :inv) {:baseball (get-item :baseball)}))
  (println (get-npcs :oldlady)))
