module Model exposing (..)

import Browser.Navigation as Nav
import Url
import Raw.RawModel exposing (RawModel, initRawModel)

type alias RootModel =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    , rawModel : RawModel
    }


initModel : Url.Url -> Nav.Key -> RootModel
initModel url key =
    { key = key
    , url = url
    , rawModel = initRawModel
    , route = Raw
    }


type Route
    = Notes
    | Animations
    | Camera
    | Cource
    | Settings
    | Raw
