module PatternMatching exposing (..)


listIsEmpty : List a -> Bool
listIsEmpty l =
    case l of
        [] ->
            True

        _ ->
            False


listFold : (a -> b -> b) -> b -> List a -> b
listFold f acc list =
    case list of
        [] ->
            acc

        h :: t ->
            listFold f (f h acc) t


trianglePerimeter : ( Int, Int, Int ) -> Int
trianglePerimeter ( a, _, c ) =
    a + c
