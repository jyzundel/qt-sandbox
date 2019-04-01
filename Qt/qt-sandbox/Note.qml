import QtQuick.Shapes 1.12
import QtQuick 2.11
import "Styles"
/*
Rectangle {
  color: "lightGray"
  Shape {
    id: shape
    width: 220
    height: 200
    anchors.centerIn: parent

    ShapePath {
      fillGradient: LinearGradient {
        y2: shape.height
        GradientStop { position: 0; color: "yellow" }
        GradientStop { position: 1; color: "green" }
      }

      startX: 10; startY: 100
      PathArc {
        relativeX: 50; y: 100
        radiusX: 25; radiusY: 25
      }
      PathArc {
        relativeX: 50; y: 100
        radiusX: 25; radiusY: 35
      }
      PathArc {
        relativeX: 50; y: 100
        radiusX: 25; radiusY: 60
      }
      PathArc {
        relativeX: 50; y: 100
        radiusX: 50; radiusY: 120
      }
    }
  }

  Shape {
    width: 120
    height: 130
    anchors.bottom: parent.bottom
    anchors.right: parent.right

    scale: 0.5

    ShapePath {
      fillColor: "transparent"
      strokeColor: "darkBlue"
      strokeWidth: 20
      capStyle: ShapePath.RoundCap

      PathAngleArc {
        centerX: 65; centerY: 95
        radiusX: 45; radiusY: 45
        startAngle: -180
        SequentialAnimation on sweepAngle {
          loops: Animation.Infinite
          NumberAnimation { to: 360; duration: 2000 }
          NumberAnimation { to: 0; duration: 2000 }
        }
      }
    }
  }
}
*/
Rectangle {
  width: 50
  height: 50

  property real w_2: 12 * 0.5
  property real h_2: 10 * 0.5

  property string moveTo: "M" + w_2 + ",0"
  property string q1: " q" + w_2 + ",0 0," + h_2
  property string q2: " q0," + h_2 + " " + -w_2 + ",0"
  property string q3: " q" + -w_2 + ",0 0," + -h_2
  property string q4: " q0," + -h_2 + " " + w_2 + ",0"
  property string end: " Z"

  Shape {
    width: 50
    height: 50
    anchors {
      bottom: parent.bottom
      right: parent.right
    }

    scale: 1.0


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

      startX: 0
      startY: 0
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

}

