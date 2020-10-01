module FuzzSpec exposing (addFuzzTest, addOneFuzzTest, addOneFuzzWithRangeTest)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, array, bool, float, int, intRange, list, maybe, string, tuple)
import Test exposing (Test, describe, fuzz, fuzz2, fuzz3, fuzzWith)


add : Int -> Int -> Int
add a b =
    a + b


addFuzzTest : Test
addFuzzTest =
    describe "Add Fuzz Test"
        [ fuzz2 int int "adds " <|
            \num1 num2 -> add num1 num2 |> Expect.equal (num1 + num2)
        , fuzz (tuple ( int, int )) "adds with tuple" <|
            \( f, s ) -> add f s |> Expect.equal (f + s)
        ]


addOne : Int -> Int
addOne i =
    add i 1


addOneFuzzTest : Test
addOneFuzzTest =
    describe "Add One Fuzz Test"
        [ fuzzWith { runs = 200 } int "adds 1 to any integer" <|
            \num -> addOne num |> Expect.equal (num + 1)
        ]


addOneFuzzWithRangeTest : Test
addOneFuzzWithRangeTest =
    describe "Add One Fuzz Test With Range"
        [ fuzz (intRange -122 122) "adds 1 to any integer" <|
            \num -> addOne num |> Expect.equal (num + 1)
        ]
