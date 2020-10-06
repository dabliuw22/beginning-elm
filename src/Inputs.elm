module Inputs exposing (..)

import Browser
import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (placeholder, style, type_)
import Html.Events exposing (onInput)


type alias Model =
    { value : String }


type Msg
    = Text String


validStyle : List (Attribute msg)
validStyle =
    [ style "font-size" "30px"
    , style "color" "sandybrown"
    ]


invalidStyle : List (Attribute msg)
invalidStyle =
    [ style "font-size" "50px"
    , style "color" "red"
    ]


init : Model
init =
    Model ""


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Type text here", onInput Text ] []
        , printText model
        ]


printText : Model -> Html msg
printText model =
    let
        styles =
            if String.length model.value <= 10 then
                validStyle

            else
                invalidStyle
    in
    div ([] ++ styles)
        [ text model.value ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Text txt ->
            { model | value = txt }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = \model -> view model
        , update = update
        }
