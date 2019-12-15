module Main exposing (..)

import Browser exposing (Document)
import Element exposing (Element, alignBottom, alignTop, centerX, centerY, column, el, fill, height, html, image, newTabLink, padding, paddingXY, paragraph, row, spacing, text, textColumn, width)
import Element.Border as Border
import Element.Font exposing (Font)
import Element.Region as Region
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Svg exposing (circle, svg)
import Svg.Attributes exposing (cx, cy, r, stroke, x1, x2, y1, y2)


type alias Model =
    {}


type Msg
    = NoOp


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


view : Model -> Document Msg
view model =
    { title = "Jakob Ferdinand Wegenschimmel"
    , body =
        [ Element.layout
            [ width fill
            , height fill
            , padding 20
            , Element.Font.family
                [ Element.Font.external
                    { name = "Montserrat"
                    , url = "https://fonts.googleapis.com/css?family=Montserrat:300&display=swap"
                    }
                ]
            ]
            (column
                [ height fill ]
                [ viewHeader model
                , viewContent model
                , viewFooter model
                ]
            )
        ]
    }


viewHeader : Model -> Element Msg
viewHeader model =
    column
        [ alignTop
        , width fill
        , spacing 8
        ]
        [ row [ width fill ]
            [ text "Header"
            ]
        , line 1
        ]


viewContent : Model -> Element Msg
viewContent model =
    column
        [ Region.mainContent
        , centerX
        , centerY
        , spacing 25
        , paddingXY 0 20
        ]
        [ image
            [ centerX
            ]
            { src = "https://avatars1.githubusercontent.com/u/16666458?s=460&v=4"
            , description = "Me hanging down the 'Himmelsleiter' on the Donnerkogel ferrata."
            }
        , el [ centerX ]
            (html
                (svg
                    [ Svg.Attributes.width "100"
                    , Svg.Attributes.height "100"
                    ]
                    [ circle
                        [ cx "50"
                        , cy "50"
                        , r "50"
                        , Svg.Attributes.fill "#aacc88"
                        ]
                        []
                    ]
                )
            )
        , el [ centerX, Element.Font.size 24 ] (text "Welcome!")
        , textColumn
            [ centerX
            , Element.Font.size 16
            , Element.Font.center
            ]
            [ paragraph [] [ text "I´m a software developer living in Austria." ]
            , paragraph [] [ text "In my day to day job I mostly use C# in .Net Client Applications." ]
            , paragraph [] [ text "Some weeks ago I discoverd the ELM programming language and immedeately felt in love with it." ]
            , paragraph [] [ text "So I decided to build my own homepage in elm. I´m excited where that will take me." ]
            ]
        , newTabLink [ centerX ] { url = "https://github.com/JakobFerdinand", label = text "My Github page." }
        , newTabLink [ centerX ] { url = "https://elm-lang.org/", label = text "A link to Elm language." }
        ]


viewFooter : Model -> Element Msg
viewFooter model =
    column
        [ alignBottom
        , width fill
        , spacing 8
        ]
        [ line 1
        , row
            [ width fill
            ]
            [ text "Footer"
            , el [ centerX ] (text "One is never alone with a rubber duck. - Douglas Adams")
            ]
        ]


line : Int -> Element Msg
line strokeWidth =
    el [ centerX ]
        (html
            (svg
                [ Svg.Attributes.height <| String.fromInt strokeWidth
                , Svg.Attributes.width "800"
                ]
                [ Svg.line
                    [ x1 "0"
                    , y1 "0"
                    , x2 "1200"
                    , y2 "0"
                    , stroke "black"
                    , Svg.Attributes.strokeWidth <| String.fromInt strokeWidth
                    , Svg.Attributes.fill "none"
                    ]
                    []
                ]
            )
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
