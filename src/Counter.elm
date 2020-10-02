module Counter exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    Int


initModel : Model
initModel =
    0


view : Model -> Html Command
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (String.fromInt model)
        , button [ onClick Increment ] [ text "+" ]
        ]


type Command
    = Increment
    | Decrement


update : Command -> Model -> Model
update cmd model =
    case cmd of
        Increment ->
            model + 1

        _ ->
            model - 1


main : Program () Model Command
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
