import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement | Increment100 | Decrement100

update msg model =
  case msg of
    Increment ->
      model + 1
    Increment100 ->
      model + 100
    Decrement ->
      model - 1
    Decrement100 ->
      model - 100

view model =
  div []
    [ div [] [ text (String.fromInt model) ] 
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Increment100 ] [ text "+100"]
    , button [ onClick Decrement100 ] [ text "-100"]
    ]