module PaletteView exposing (Model, Msg, init, update, view)

import Browser
import Element exposing (Color, Element, centerX, centerY, column, el, fill, height, html, row, spacing, text)
import Palette exposing (..)
import Svg exposing (circle, svg)
import Svg.Attributes


type alias Model =
    {}


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Element Msg
view model =
    row
        [ spacing large
        , centerX
        , centerY
        ]
        [ viewColor { name = "foreground", color = foregroundColor, colorString = foregroundColorString }
        , viewColor { name = "background", color = backgroundColor, colorString = backgroundColorString }
        , viewColor { name = "accent1", color = accent1Color, colorString = accent1ColorString }
        , viewColor { name = "accent2", color = accent2Color, colorString = accent2ColorString }
        , viewColor { name = "accent3", color = accent3Color, colorString = accent3ColorString }
        ]


viewColor : { name : String, color : Color, colorString : String } -> Element Msg
viewColor color =
    column
        [ height fill
        , spacing xSmall
        ]
        [ colorCircle color.colorString
        , el [ centerX ] (text color.name)
        , el [ centerX ] (text color.colorString)
        ]


colorCircle : String -> Element Msg
colorCircle color =
    el []
        (html
            (svg
                [ Svg.Attributes.width "100"
                , Svg.Attributes.height "100"
                ]
                [ circle
                    [ Svg.Attributes.cx "50"
                    , Svg.Attributes.cy "50"
                    , Svg.Attributes.r "50"
                    , Svg.Attributes.fill color
                    ]
                    []
                ]
            )
        )
