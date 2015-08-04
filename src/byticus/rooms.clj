(ns byticus.rooms)

(defrecord Room [desc north south east west contents])

(def rooms
  {:hallway (->Room "A pretty dark hallway." :wall "" "" "" #{})
   :wall (->Room "A not so nice wall." "" :hallway "" "" #{})})

