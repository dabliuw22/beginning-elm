module Inputs exposing (..)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (placeholder, style, type_)
import Html.Events exposing (onInput)


type alias Model =
    { text : String }


type Msg
    = Text String


textStyle : List (Attribute msg)
textStyle =
    [ style "font-size" "50px"
    , style "color" "sandybrown"
    ]


init : Model
init =
    Model ""


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Type text here", onInput Text ] []
        , div ([] ++ textStyle) [ printText model ]
        ]


printText : Model -> Html msg
printText model =
    if String.length model.text <= 10 then
        text model.text

    else
        text "Invalid"


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
