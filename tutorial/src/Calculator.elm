module Calculator exposing (Msg)
import Browser
import Html exposing (Html, Attribute, div, input, text, br, button)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput, onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL


type alias Model =
  { numtxt1 : String
  , numtxt2 : String
  , num1 : Int
  , num2 : Int
  , answer : Int
  }


init : Model
init =
  { numtxt1 = "1"
  , numtxt2 = "1"
  , num1 = 0
  , num2 = 0
  , answer = 0
  }



-- UPDATE


type Msg
  = Convert1 String | Convert2 String | Add 


update : Msg -> Model -> Model
update msg model =
  case msg of
    Convert1 xString ->
      case String.toInt xString of
        Nothing ->
          model
        Just _ ->
          { model | num1 = model.numtxt1 }
    Convert2 xString ->
      case String.toInt xString of
        Nothing ->
          model
        Just _ ->
          { model | num2 = model.numtxt2 }
    Add ->
      { model | answer = model.num1 + model.num2 }
      
    
    



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ value model.numtxt1, onInput Convert1 ] []
    , input [ value model.numtxt2, onInput Convert2 ] []
    , button [ onClick Add ] [ text "Add"]
    , div [] [ text (String.fromInt model.answer) ]
    ]