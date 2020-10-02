module Signup exposing (main)

import Html exposing (Html, button, div, form, h1, input, text)
import Html.Attributes exposing (id, type_)


type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


init : User
init =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }


view : User -> Html cmd
view user =
    div []
        [ h1 [] [ text "Sign Up" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text" ] []
                ]
            , div []
                [ text "Email"
                , input [ id "email", type_ "email" ] []
                ]
            , div []
                [ text "Password"
                , input [ id "password", type_ "password" ] []
                ]
            , div []
                [ button [ type_ "submit" ]
                    [ text "Create my account" ]
                ]
            ]
        ]


main : Html msg
main =
    view init
