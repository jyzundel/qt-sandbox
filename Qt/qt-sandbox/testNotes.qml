import QtQuick 2.9
import "Styles"

Rectangle {
  id: test
  height: canvas.height + 20
  width: 600
  color: "cyan"

  QtObject {
    id: internal

    property string openNote: "\u1d15d"
    property string fillNote: "\u1d15f"
    property string flat: "\u266d"
    property string natural: "\u266e"
    property string sharp: "\u266f"

    property var notes: [openNote, fillNote, flat, natural, sharp]
  }

  Rectangle {
    id: canvas
    color: "white"
    height: StyleManager.lineNoteHeight * 12 + StyleManager.noteHeight * 0.5
    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
      margins: 10
    }

    StdStaff {
      id: staffLines
      anchors {
        top: parent.top
        topMargin: StyleManager.lineNoteHeight * 4
        left: parent.left
        right: parent.right
      }
    }

    // Notes added a comment
    Beat {
      id: chord
      anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left
        leftMargin: 100
      }
    }

    // Labels
    Repeater {
      id: spaceLabels
      width: 340
      anchors {
        top: parent.top
        //topMargin: StyleManager.lineNoteHeight * 0.5
        left: parent.left
      }
/*
      Component.onCompleted: {
        console.log("spaceLabels y: " + y + 
        " lineNoteHeight: "  + StyleManager.lineNoteHeight)
      }*/

      model: ["F", "E", "D", "C", "B", "A", "G", "F", "E", "D", "C", "B", "A", "G", "F", "E", "D", "C", "B", "A", "G", "F", "E", "D"]
      delegate: Rectangle {
        id: spaceRect

        property real offsetX: index & 0x1 ? 0.0 : width
        height: StyleManager.lineNoteHeight
        width: height
        color: "#C0ffffff"
        anchors {
          top: spaceLabels.top
          topMargin: height * index * 0.5
          right: spaceLabels.right
          rightMargin: spaceRect.offsetX
        }
/*
        Component.onCompleted: {
          console.log("delegate: " + index + " y: " + y)
        }*/

        Text {
          id: spaceLabel
          font.pixelSize: StyleManager.noteHeight * 0.8
          text: modelData
          color: "black"
          anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: spaceLabel.font.pixelSize * 0.3
          }
/*
          Component.onCompleted: {
            console.log("Delegate Text: " + text + " y: " + y)
          }*/
        }
      }
    }

  }
}
