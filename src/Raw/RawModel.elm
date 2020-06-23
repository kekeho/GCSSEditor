module Raw.RawModel exposing (..)

type alias RawModel =
    { rawStringNotes : String
    , rawStringScore : String
    }


initRawModel : RawModel
initRawModel =
    { rawStringNotes = ""
    , rawStringScore = ""
    }

