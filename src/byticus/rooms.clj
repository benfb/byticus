(ns byticus.rooms)

(defrecord Room [desc exits contents])

(def rooms
  {:hallway (->Room "A pretty dark hallway." {:north :wall :east :bar} #{})
   :wall (->Room "A not so nice wall." {:south :hallway} #{})
   :bar (->Room "A dingy (dinjy?) bar." {:west :hallway} #{})})
