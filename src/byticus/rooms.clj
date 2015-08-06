(ns byticus.rooms)

(defrecord Room [desc exits people items])

(def rooms
  {:hallway (->Room "a pretty dark hallway" {:north :wall :east :bar} #{} #{})
   :wall (->Room "a not so nice wall" {:south :hallway} #{} #{})
   :bar (->Room "a dingy bar" {:west :hallway} #{} #{})})
