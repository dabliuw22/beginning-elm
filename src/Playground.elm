module Playground exposing (..)

import Html


escape : Float -> Float -> String
escape velocity speed =
    let
        vel =
            100.0

        spe =
            10.0
    in
    if velocity >= vel then
        ">"

    else if speed >= spe then
        ">"

    else
        "<"


calculateSpeed : Float -> Float -> Float
calculateSpeed distance time =
    distance / time


calculateTime : Float -> Float -> Float
calculateTime init end =
    end - init


main =
    --Html.text (escape 10.0 (calculateSpeed 200.0 (calculateTime 100 200)))
    --calculateTime 100 200
    --    |> calculateSpeed 200.0
    --    |> escape 10.0
    --    |> Html.text
    Html.text <|
        escape 10.0 <|
            calculateSpeed 200.0 <|
                calculateTime 100 200
