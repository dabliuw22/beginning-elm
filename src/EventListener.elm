module EventListener exposing (..)

import Browser
import Browser.Events exposing (onClick, onKeyPress)
import Html exposing (..)
import Json.Decode as Decode


type alias Model =
    Int


type Msg
    = CharacterKey Char
    | ControlKey String
    | MouseClick


toKey : String -> Msg
toKey keyValue =
    let
        _ =
            Debug.log "Key" keyValue
    in
    case String.uncons keyValue of
        Just ( c, "" ) ->
            CharacterKey c

        _ ->
            ControlKey keyValue


keyDecoder : Decode.Decoder Msg
keyDecoder =
    Decode.map toKey (Decode.field "key" Decode.string)


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ text (String.fromInt model) ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CharacterKey _ ->
            ( model + 1, Cmd.none )

        MouseClick ->
            ( model + 5, Cmd.none )

        _ ->
            ( model - 1, Cmd.none )



{-
   subscriptions : Model -> Sub Msg
   subscriptions _ =
       onKeyPress keyDecoder

-}


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ onKeyPress keyDecoder, onClick (Decode.succeed MouseClick) ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
