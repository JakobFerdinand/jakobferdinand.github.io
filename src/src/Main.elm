module Main exposing (..)

import Browser exposing (Document)
import Element exposing (Element, centerX, centerY, column, el, fill, height, image, newTabLink, paragraph, row, spacing, text, textColumn, width)
import Element.Font exposing (Font)
import Html exposing (Html, div)
import Html.Attributes exposing (class)


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
    , body = [ viewContent model ]
    }


viewContent : Model -> Html Msg
viewContent model =
    Element.layout
        [ width fill
        , height fill
        , Element.Font.family
            [ Element.Font.external
                { name = "Montserrat"
                , url = "https://fonts.googleapis.com/css?family=Montserrat:300&display=swap"
                }
            ]
        ]
        (column [ centerX, centerY, spacing 25 ]
            [ image [ centerX ] { src = "https://avatars1.githubusercontent.com/u/16666458?s=460&v=4", description = "" }
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
