module SignupWithBootstrap exposing (main)

import Html exposing (Html, button, div, form, h1, input, label, text)
import Html.Attributes exposing (class, for, id, type_)


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
    div [ class "container" ]
        [ div [ class "row" ]
            [ div [ class "col-md-6 col-md-offset-3" ]
                [ h1 [ class "text-center" ] [ text "Sign up" ]
                , Html.form []
                    [ div [ class "form-group" ]
                        [ label
                            [ class "control-label"
                            , for "name"
                            ]
                            [ text "Name" ]
                        , input
                            [ class "form-control"
                            , id "name"
                            , type_ "text"
                            ]
                            []
                        ]
                    , div [ class "form-group" ]
                        [ label
                            [ class "control-label"
                            , for "email"
                            ]
                            [ text "Email" ]
                        , input
                            [ class "form-control"
                            , id "email"
                            , type_ "email"
                            ]
                            []
                        ]
                    , div [ class "form-group" ]
                        [ label
                            [ class "control-label"
                            , for "password"
                            ]
                            [ text "Password" ]
                        , input
                            [ class "form-control"
                            , id "password"
                            , type_ "password"
                            ]
                            []
                        ]
                    , div [ class "text-center" ]
                        [ button
                            [ class "btn btn-lg btn-primary"
                            , type_ "submit"
                            ]
                            [ text "Create my account" ]
                        ]
                    ]
                ]
            ]
        ]


main : Html cmd
main =
    view init
