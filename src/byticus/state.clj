(ns byticus.state
  (:require [byticus.rooms :refer [rooms]]))

(defrecord Player [title health denarii location inventory])

(defrecord Enemy [title health strength location inventory])

(def world-state (atom {
  :rooms rooms
  :player (->Player "Joe" 100 10 (:hallway rooms) #{})}))

(defn get-state [key]
  (@world-state key))

(defn update-state [key val]
  (swap! world-state assoc key val))

(defn get-player [key]
  (key (get-state :player)))

(defn update-player [key val]
  (update-state :player (assoc (get-state :player) key val)))

(defn get-room [key]
  (key (get-state :rooms)))