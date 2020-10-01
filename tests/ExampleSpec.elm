module ExampleSpec exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import List exposing (foldr)
import Test exposing (..)


simpleTest : Test
simpleTest =
    test "firts"
        (\_ -> Expect.equal 4 (2 + 2))


groupTest : Test
groupTest =
    describe "Example"
        [ test "secound"
            (\_ -> (2 + 1) |> Expect.equal 3)
        , test
            "third"
          <|
            \_ ->
                let
                    x =
                        10
                in
                Expect.notEqual x (5 * 3)
        , test "fourth" <|
            \_ -> Expect.greaterThan 9 <| foldr (\v a -> a + v) 0 [ 1, 2, 3, 4 ]
        ]
