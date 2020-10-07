module Guess exposing (..)

import Browser
import Html exposing (Attribute, Html, button, div, h2, input, text)
import Html.Attributes exposing (placeholder, style, type_)
import Html.Events exposing (onClick, onInput)
import String exposing (words)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = \model -> view model
        , update = update
        }


type Msg
    = Answer String
    | Reveal


type alias Model =
    { word : String
    , guess : String
    , isCorrect : Bool
    , revealedWord : String
    , revealedPos : Int
    }


init : Model
init =
    Model "Saturday" "" False "S" 1


getFirst : String -> String
getFirst txt =
    String.slice 0 1 txt


getResult : Model -> Html Msg
getResult { isCorrect } =
    if isCorrect then
        text "Winner!!!"

    else
        text "Loser"


view : Model -> Html Msg
view model =
    div []
        [ h2 []
            [ text ("I'm thinking of a word that starts with " ++ model.revealedWord) ]
        , input [ placeholder "Type your guess", onInput Answer ] []
        , button [ onClick Reveal ] [ text "More information" ]
        , div [] [ getResult model ]
        ]


revealLetter : Model -> String
revealLetter model =
    String.slice 0 model.revealedPos model.word


getPos : Model -> Int
getPos model =
    if String.length model.guess <= model.revealedPos then
        model.revealedPos + 1

    else
        model.revealedPos


update : Msg -> Model -> Model
update msg model =
    case msg of
        Answer txt ->
            { model | guess = txt, isCorrect = validate model txt }

        Reveal ->
            { model
                | revealedPos = getPos model
                , revealedWord = revealLetter model
            }


validate : Model -> String -> Bool
validate model txt =
    txt == model.word
