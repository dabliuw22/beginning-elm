module Signup exposing (main)

import Browser
import Html exposing (Html, button, div, form, h1, input, text)
import Html.Attributes exposing (id, type_)
import Html.Events exposing (onClick, onInput)
import VirtualDom


type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


type Msg
    = SaveName String
    | SaveEmail String
    | SavePassword String
    | Signup


init : User
init =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }


view : User -> Html Msg
view user =
    div []
        [ h1 [] [ text "Sign Up" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text", onInput SaveName ] []
                ]
            , div []
                [ text "Email"
                , input [ id "email", type_ "email", onInput SaveEmail ] []
                ]
            , div []
                [ text "Password"
                , input [ id "password", type_ "password", onInput SavePassword ] []
                ]
            , div []
                [ button [ type_ "submit", onClick Signup ]
                    [ text "Create my account" ]
                ]
            ]
        ]


update : Msg -> User -> User
update msg user =
    case msg of
        SaveName n ->
            { user | name = n }

        SaveEmail e ->
            { user | email = e }

        SavePassword p ->
            { user | password = p }

        Signup ->
            { user | loggedIn = True }


main : Program () User Msg
main =
    Browser.sandbox
        { init = init
        , view = \model -> view model
        , update = update
        }
