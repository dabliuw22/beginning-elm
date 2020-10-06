module Inputs exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


type alias Model =
    { text : String }


type Msg
    = Text String


init : Model
init =
    Model ""


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Type text here", onInput Text ] []
        , div [] [ text model.text ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Text txt ->
            { model | text = txt }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = \model -> view model
        , update = update
        }
