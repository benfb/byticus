(ns byticus.rooms)

(defrecord Room [desc exits people items])

(def rooms
  {:hallway (->Room "pretty dark hallway" {:north :wall :east :bar} {} {})
   :wall (->Room "not so nice wall" {:south :hallway} {} {})
   :bar (->Room "dingy bar" {:west :hallway} {} {})})
