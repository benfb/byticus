(ns byticus.rooms)

(defrecord Room [desc exits contents])

(def rooms
  {:hallway (->Room "A pretty dark hallway." {:north :wall} #{})
   :wall (->Room "A not so nice wall." {:south :hallway} #{})})
