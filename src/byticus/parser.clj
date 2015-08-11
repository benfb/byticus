(ns byticus.parser
  (:require [instaparse.core :as insta]))

(def verb-noun
  (insta/parser
    "S = V0 | V1 <' '> N | V2 (<' '>N)+
     V0 = ('help' | 'rest' | 'look' | 'exit')
     V1 = ('eat' | 'wash' | 'go')
     V2 = ('give')
     N = ('food' | 'hands' | 'me' | DIR)
     DIR = ('north' | 'south' | 'east' | 'west')"))

(def transform-options
   {:V0 str
    :V1 str
    :V2 str
    :N str
    :DIR str
   })

(defn parse-vn [input]
  (let [parsed (insta/transform transform-options (verb-noun input))]
    (when-not (insta/failure? parsed)
     (hash-map :verb (second parsed), :nouns (drop 1 (rest parsed))))))
