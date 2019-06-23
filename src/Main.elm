module Main exposing (main)

import Browser
import CodeBlock exposing (codeBlock)
import Html exposing (Html, a, button, code, div, h1, img, p, pre, span, text)
import Html.Attributes exposing (class, href, id, name, src)
import Html.Events exposing (onClick)
import Introduction exposing (introduction, introductionView)
import Msg exposing (..)
import Random


type Usage
    = Gradle
    | Maven


type alias Model =
    { usage : Usage
    , exampleIndex : Int
    }


initialModel : flag -> ( Model, Cmd Msg )
initialModel flag =
    ( { usage = Gradle
      , exampleIndex = 0
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChooseGradle ->
            ( { model | usage = Gradle }
            , Cmd.none
            )

        ChooseMaven ->
            ( { model | usage = Maven }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div []
        [ div [ id "top-bar" ] [ topBar ]
        , div [ id "body" ]
            [ firstSection
            , sectionIntroduction
            , sectionFeatures model
            , sectionUsages model
            , sectionBottom
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    -- Browser.application
    Browser.element
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


topBar : Html Msg
topBar =
    div []
        [ a [ href "https://github.com/NawaMan/NullableJ" ]
            [ img [ id "github-ribbon", src "github-ribbon.png" ] []
            ]
        ]


firstSection : Html Msg
firstSection =
    div [ class "section section-first" ]
        [ div [ class "content" ] [ text "NullableJ" ]
        ]


sectionIntroduction : Html Msg
sectionIntroduction =
    div [ class "section section-introduction" ]
        [ introductionView ]


sectionFeatures : Model -> Html Msg
sectionFeatures model =
    div [ class "section section-features" ]
        [ h1 [ class "center" ] [ text "Features" ]
        , p [ class "center" ] [ text "Be be added later." ]
        ]


useGradle : Html Msg
useGradle =
    div []
        [ p []
            [ text "This project binary is published on "
            , a [ href "https://github.com/NawaMan/nawaman-maven-repository" ]
                [ text "my maven repo"
                ]
            , text " hosted on GitHub. So to use NullableJ.io you will need to ..."
            ]
        , p [] [ text "Add the maven repository ..." ]
        , codeBlock "maven { url 'https://raw.githubusercontent.com/nawmaman/nawaman-maven-repository/master/' }"
        , p [] [ text "and the dependencies to NullableJ.io." ]
        , codeBlock "compile 'io.nullablej:nullablej-all:4.0.0.0' // Please lookup for the latest version."
        , p []
            [ a [ href "https://github.com/NawaMan/UseNullableJGradle" ] [ text "UseNullableJGradle" ]
            , text " is an example project that use NullableJ.io. You can use that as a starting point."
            ]
        ]


useMaven : Html Msg
useMaven =
    div []
        [ p []
            [ text "This project binary is published on "
            , a [ href "https://github.com/NawaMan/nawaman-maven-repository" ]
                [ text "my maven repo"
                ]
            , text " hosted on GitHub. So to use NullableJ.io you will need to ..."
            ]
        , p [] [ text "Adding the required maven repository (hosted by github)." ]
        , codeBlock """
<repository>
    <id>Nullable-mvn-repo</id>
    <url>https://raw.githubusercontent.com/nawaman/nawaman-maven-repository/master/</url>
    <snapshots>
        <enabled>true</enabled>
        <updatePolicy>always</updatePolicy>
    </snapshots>
</repository>
        """
        , p [] [ text "and the dependencies to NullableJ.io." ]
        , codeBlock """
    <dependency>
        <groupId>io.nullablej</groupId>
        <artifactId>nullablej-all</artifactId>
        <version>4.0.0.0</version>
    </dependency>
        """
        , p []
            [ a [ href "https://github.com/NawaMan/UseNullableJMaven" ] [ text "UseUseNullableJMaven" ]
            , text " is an example project that use UseNullableJ.io. You can use that as a starting point."
            ]
        ]


sectionUsages : Model -> Html Msg
sectionUsages model =
    div [ class "section section-usages" ]
        [ h1 [] [ text "Usages" ]
        , div [ class "usage-selector" ]
            [ button [ onClick ChooseGradle ] [ text "GRADLE" ]
            , button [ onClick ChooseMaven ] [ text "MAVEN" ]
            ]
        , case model.usage of
            Gradle ->
                useGradle

            Maven ->
                useMaven
        ]


sectionBottom : Html Msg
sectionBottom =
    div [ class "section section-bottom" ]
        [ p []
            [ text "© 2017-2019 NawaMan's NullableJ.io — NullableJ.io is Open Source, "
            , a [ href "https://github.com/NawaMan/NullableJ/blob/master/LICENSE" ] [ text "MIT License" ]
            , text "."
            ]
        , p []
            [ text "Find code on "
            , a [ href "https://github.com/NawaMan/NullableJ" ] [ text "GitHub" ]
            ]
        ]
