(ns byticus.people-test
  (:require [clojure.test :refer :all]
            [byticus.people :refer :all]))

(deftest player-defined
  (testing "The player is defined"
    (is (= #byticus.people.Person{:title "Joe", :health 100, :denarii 10, :inv {}}
           player))))