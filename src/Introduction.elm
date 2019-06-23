module Introduction exposing (introduction, introductionView)

import Html exposing (Html, div, text)


introductionView : Html msg
introductionView = div [] [ text introduction ]


introduction =
    """
NullableJ.io is a a library for dealling with Null for Java.
It exployed four ways: ignore it, wrap it, replace it, replace it and fake it.
NullableJ contains methods to that ignore the effect of null.
Using it witl Lombok's extension method will make those methods looks like
  they are methods that ignore null completely.
Nullable is a class that wrap a nullable value and hanle them safely.
NullValue annotation can be used to specify a value to be null value of a specify type;
  this value can be used as replacement for null for that type.
NullableData can create a fake data that are null-safe for any interface.
"""
