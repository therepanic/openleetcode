module Core.Test.Converter where

import Core.Generator.Class
import Core.Test.Types

toGenInfo :: GeneratedInData -> GenInfo
toGenInfo (GIDIntegral i) = GenIntegralInfo (toGenIntegral i)
toGenInfo (GIDFloat f) = GenFloatInfo (toGenFloat f)
toGenInfo (GIDChar c) = GenCharInfo (toGenChar c)
toGenInfo (GIDArr a) = GenArrInfo (toGenArr a)
toGenInfo (GIDBool b) = GenBoolInfo (toGenBool b)
toGenInfo (GIDStr l a) = GenStrInfo (GenStr (toGenIntegral l) a)

toGenIntegral :: GIDIntegral -> GenIntegral
toGenIntegral (GIDGenIntegralConst c) = GenIntegralConst c
toGenIntegral (GIDGenIntegralRange lo hi) = GenIntegralRange lo hi

toGenFloat :: GIDFloat -> GenFloat
toGenFloat (GIDGenFloatConst c) = GenFloatConst c
toGenFloat (GIDGenFloatRange lo hi p) = GenFloatRange lo hi p

toGenChar :: GIDChar -> GenChar
toGenChar (GIDGenCharConst c) = GenCharConst c
toGenChar (GIDGenCharVariety v) = GenCharVariety v

toGenBool :: GIDBool -> GenBool
toGenBool (GIDGenBoolConst b) = GenBoolConst b
toGenBool GIDGenBoolGen = GenBoolGen

toGenArr :: GIDArr -> GenArr
toGenArr (GIDArrGen d _ l o) = GenArr d (toGenIntegral l) (toGenInfo o)
toGenArr (GIDArrConst _) = error "constant array cannot be converted to GenArr"
