import QtQuick.Shapes 1.12
import QtQuick 2.9
import "Styles"

Rectangle {
  width: 50
  height: 50

  property real w_2: 12 * 0.5
  property real h_2: 10 * 0.5

  property string moveTo: "M " + w_2 + " 0"
  property string q1: " q " + w_2 + " 0 0 " + h_2
  property string q2: " q 0 " + h_2 + " " + -w_2 + " 0"
  property string q3: " q " + -w_2 + " 0 0 " + -h_2
  property string q4: " q 0 " + -h_2 + " " + w_2 + " 0"
  property string end: " Z"

  ShapePath {
    strokeColor: "black"
    strokeWidth: 2
    fillColor: "transparent"
    capStyle: ShapePath.RoundCap

    property real width: 12
    property real height: 10

    property int joinStyleIndex: 0
    property variant styles: [
      ShapePath.BevelJoin,
      ShapePath.MiterJoin,
      ShapePath.RoundJoin
    ]

    joinStyle: styles[joinStyleIndex]
    fillRule: ShapePath.OddEvenFill

    PathSvg {
      path: moveTo + q1 + q2 + q3 + q4 + end

      Component.onCompleted: {
        console.log("moveTo: " + moveTo)
        console.log("q1: " + q1)
        console.log("q2: " + q2)
        console.log("q3: " + q3)
        console.log("q4: " + q4)
        console.log(end)
        console.log("path: " + path)
      }
    }
  }

}

