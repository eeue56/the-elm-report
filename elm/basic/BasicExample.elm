module BasicExample where
import Html exposing (div, button, text)
import Html.Events exposing (onClick)

type Action = Increment | Decrement | None
type alias Model = Int

model : Model
model = 0

currentClick : Signal.Mailbox Action
currentClick = Signal.mailbox None

update : Action -> Model -> Model
update action model =
    case action of
        Increment -> model + 1
        Decrement -> model - 1
        None -> model

view : Signal.Address Action -> Model -> Html.Html
view address model = div []
    [ button [ onClick address Increment ] [ text "+" ]
    , div [] [ text (toString model) ]
    , button [ onClick address Decrement ] [ text "-" ]
    ]


model' = Signal.foldp update model currentClick.signal

main = Signal.map (view currentClick.address) model'