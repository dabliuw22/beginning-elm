module HttpExamples exposing (..)

import Html exposing (Html, button, div, h3, li, text, ul)
import Html.Events exposing (onClick)
import Http


type alias Model =
    List String


type Msg
    = SendHttpRequest
    | DataReceived (Result Http.Error String)


viewNickname : String -> Html Msg
viewNickname nickname =
    li [] [ text nickname ]


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick SendHttpRequest ]
            [ text "Get data from server" ]
        , h3 [] []
        , ul [] (List.map viewNickname model)
        ]


url : String
url =
    "http://localhost:5016/old-school.txt"
