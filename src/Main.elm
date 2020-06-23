-- Copyright (c) 2020 Hiroki Takemura (kekeho)
-- 
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

module Main exposing (..)

import Html exposing (..)
import Browser
import Browser.Navigation as Nav
import Url
import Html.Attributes exposing (..)


main : Program () RootModel Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
    }


type alias RootModel =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> (RootModel, Cmd Msg)
init _ url key =
    (RootModel key url
    , Cmd.none)


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> RootModel -> (RootModel, Cmd Msg)
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )


subscriptions : RootModel -> Sub Msg
subscriptions model =
    Sub.none


view : RootModel -> Browser.Document Msg
view model =
    { title = "GCSSEditor"
    , body =
        [ nav [ class "navbar" ]
            [ div [ class "gcsse-logo" ]
                [ img [ src "assets/img/gcsse.svg", class "gcsse-logo-img" ] [] ]
            , div [ class "project-name" ]
                [ input [ placeholder "Project Name", value "Untitled Project" ] []
                ]
            ]

        , div [ class "app" ]
            [ div [ class "left-sidepanel" ]
                [ div [ class "mode" ]
                    [ img [ src "assets/img/notes.svg" ] []
                    , text "Notes"
                    ]
                , div [ class "mode" ]
                    [ img [ src "assets/img/anime.svg" ] []
                    , text "Animations"
                    ]
                , div [ class "mode" ]
                    [ img [ src "assets/img/cam.svg" ] []
                    , text "Camera"
                    ]
                , div [ class "mode" ]
                    [ img [ src "assets/img/cource.svg" ] []
                    , text "Course"
                    ]
                , div [ class "mode" ]
                    [ img [ src "assets/img/settings.svg" ] []
                    , text "Settings"
                    ]
                , div [ class "mode" ]
                    [ img [ src "assets/img/raw.svg" ] []
                    , text "Raw"
                    ]
                ]
            ]
        ]
    }
