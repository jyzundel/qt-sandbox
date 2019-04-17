import QtQuick 2.9
import "Styles"

Rectangle {
  id: test
  width: 600
  height: StyleManager.lineNoteHeight * 12.5 + 20
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
    color: "white"
    anchors {
      fill: parent
      margins: 10
    }

    // Notes added a comment
    Repeater {
      id: notes 

      anchors {
        //top: parent.top
        //topMargin: StyleManager.lineHeight
        left: parent.left
        leftMargin: 100
      } 
      model: 24
      delegate: Rectangle {
        property real offsetX: index & 0x1 ? width : 0.0
        width: height * 1.2
        height: StyleManager.noteHeight
        color: "#80008000"
        anchors {
          top: notes.top
          topMargin: StyleManager.lineNoteHeight * index * 0.5
          left: notes.left
          leftMargin: offsetX
        } 
        
        IconSvg {
          id: noteSvg
          name: "note"
          color: index & 0x1 ? "red" : "black"
          width: height * 1.2
          height: parent.height
          anchors.centerIn: parent
        }

        StdLine {
          id: ledgerLine
          visible: index & 0x1
          lineWidth: parent.width * 1.4  
          anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -lineWidth * 0.5
            //verticalCenter: parent.verticalCenter
          }
        }
      }
/*    delegate: IconSvg {
        id: noteSvg

        property real offsetX: index & 0x1 ? width : 0.0
        width: height * 1.2
        height: StyleManager.noteHeight
        name: "note"
        color: index & 0x1 ? "red" : "black"
        anchors {
          top: notes.top
          topMargin: StyleManager.lineNoteHeight * index * 0.5
          left: notes.left
          leftMargin: offsetX
        }
      }*/
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

      Component.onCompleted: {
        console.log("spaceLabels y: " + y + 
        " lineNoteHeight: "  + StyleManager.lineNoteHeight)
      }

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

        Component.onCompleted: {
          console.log("delegate: " + index + " y: " + y)
        }

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

          Component.onCompleted: {
            console.log("Delegate Text: " + text + " y: " + y)
          }
        }
      }
    }

    Repeater {
      id: lines
      width: 300
      model: 5
      anchors {
        top: parent.top
        topMargin: StyleManager.lineNoteHeight * 3.5
        left: parent.left
      }

      delegate: StdLine {
        lineWidth: 300
        anchors {
          top: lines.top
          topMargin: StyleManager.lineNoteHeight * index
          left: lines.left
        }
      }
    }
  }
}
