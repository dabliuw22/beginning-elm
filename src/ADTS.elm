module ADTS exposing (Maybe(..), Person(..), Product, fromMaybe)

-- Record


type alias Product =
    { id : String
    , name : String
    }



-- Product ADT


type Person
    = Person
        { id : String
        , name : String
        }


person : Person
person =
    Person
        { id = "P1"
        , name = "N1"
        }


product : Product
product =
    Product "id1" "name1"


newProduct : Product
newProduct =
    { product | id = "newId", name = "newName" }



-- Coproduct ADT


type Maybe a
    = Nothing
    | Just a


fromMaybe : Maybe String -> String
fromMaybe m =
    case m of
        Just v ->
            v

        _ ->
            ""
