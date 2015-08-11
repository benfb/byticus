(ns byticus.parser-test
  (:require [clojure.test :refer :all]
            [byticus.parser :refer :all]))

(deftest invalid-verb
  (testing "An invalid verb produces nothing"
    (is (= (nil? (parse-vn "aasldkfj me"))
           true))))

(deftest invalid-noun
  (testing "An invalid noun produces nothing"
    (is (= (nil? (parse-vn "eat sun"))
           true))))

(deftest valid-string
  (testing "A correct tree is produced by the parser"
    (is (= (:verb (parse-vn "help"))
           "help"))))

(deftest disallow-extra-nouns
  (testing "The parser does not allow extraneous nouns"
    (is (= (:nouns (parse-vn "help me"))
           nil))))