module Main exposing (Msg)
import Browser
import Html exposing (Html, button, div, text, br)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement | Increment10 | Decrement10 | Reset

update msg model =
  case msg of
    Increment ->
      model + 1
    Increment10 ->
      model + 10
    Decrement ->
      model - 1
    Decrement10 ->
      model - 10
    Reset ->
      model - model

view model =
  div []
    [ div [] [ text (String.fromInt model) ] 
    , br [] []
    , div [] [ text ("Operations to perform on the numbers:") ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment10 ] [ text "+10"]
    , button [ onClick Decrement10 ] [ text "-10"]
    , button [ onClick Reset ] [ text "Reset Numerals" ]
    ]