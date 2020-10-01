module Lists exposing (..)

import Html exposing (text)
import List exposing (..)


main =
    text <|
        String.fromInt <|
            foldr (\v a -> a + v) 0 [ 1, 2, 3, 4 ]



--text <|
--  String.fromInt <|
--    length [ '1', '2', '3', '4' ]
