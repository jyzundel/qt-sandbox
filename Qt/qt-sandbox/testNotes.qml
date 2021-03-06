import QtQuick 2.9
import "Styles"

Rectangle {
  id: root
  height: canvas.height + 20
  width: 600
  color: "cyan"

  property var model: [      "F", "E", "D", "C", "B", "A", 
                        "G", "F", "E", "D", "C", "B", "A", 
                        "G", "F", "E", "D", "C", "B", "A", 
                        "G", "F", "E", "D"]
  property var beatBits: (0x1 << internal.noteCount) - 1

  property int accidentals: 0b11101110
  property bool editAccidentals: true

  QtObject {
    id: internal

    property string openNote: "\u1d15d"
    property string fillNote: "\u1d15f"
    property string flat: "\u266d"
    property string natural: "\u266e"
    property string sharp: "\u266f"

    property var notes: [openNote, fillNote, flat, natural, sharp]
    property int noteCount: model.length
    property int lineCount: noteCount / 2
  }

  Rectangle {
    id: canvas
    color: "white"
    height: StyleManager.lineNoteHeight * internal.lineCount + StyleManager.noteHeight * 0.5
    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
      margins: 10
    }

    MouseArea {
      id: canvasArea
      anchors.fill: parent
      hoverEnabled: true
      
      property int noteIndex

      function getNoteIndex(mouseY) {
        //console.log("getNoteIndex mouseY: " + mouseY)
        var canvasY = height - mouseY - StyleManager.noteHeight * 0.25
        //console.log("    canvasY: " + canvasY)
        var index = Math.floor(canvasY / (StyleManager.lineNoteHeight * 0.5))
        //console.log("    index: " + index)
        return index
      }

      function getIndexY() {
        var index = internal.noteCount - 1 - noteIndex
        if (index < 0) {
          index = 0
        } else if (index > internal.noteCount - 1) {
          index = internal.noteCount - 1
        }
        console.log("getIndexY: " + index)
        var y = StyleManager.lineNoteHeight * (index >> 1)
        if (index & 0x1) {
          y += StyleManager.noteHeight * 0.5
        }
        return y
      }

      onEntered: {
        noteIndex = getNoteIndex(mouseY)
        preHighlight.y = getIndexY()
        console.log("Entered index: " + noteIndex)
      }

      onPositionChanged: {
        var index = getNoteIndex(mouseY)
        if (index != noteIndex) {
          console.log("index changed: " + index)
          noteIndex = index
          preHighlight.y = getIndexY()
        }      
      }

      onClicked: {
        beatBits ^= 0x1 << noteIndex
      }
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

    Rectangle {
      id: preHighlight
      height: StyleManager.lineNoteHeight
      y: 0
      color: "grey"
      anchors {
        left: parent.left
        right: parent.right
      }
    }

    // Notes added a comment
    Beat {
      id: chord
      notePattern: beatBits
      anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left
        leftMargin: 300
      }
    }

    // Labels
    Repeater {
      id: spaceLabels
      width: 500
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

      model: root.model
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

    SharpFlat {
      accidentalBits: accidentals 
      bitIndex: 7
      editEnabled: editAccidentals
      visible: true

      onLongPressed: editAccidentals = !editAccidentals

      onClickedSharpOrFlat: {
        accidentals ^= maskBit
        console.log("accidentals: " + accidentals.toString(2) + " maskBit: " + maskBit)
      }

      anchors {
        top: parent.top
        left: parent.left
        topMargin: 10
        leftMargin: 10
      }
    }

    SharpsFlats {
      // 0x1 0b1
      // 0x2 0b10
      // 0x3 0b11
      // 0x4 0b100   0x5 0b101    0x6 0b110     0x7 0b111
      // 0x8 0b1000  0x9 0b1001   0xa 0b1010    0xb 0b1011   0xc 0b1100   0xd 0b1101   0xf  0b1111
      accidentalBits: accidentals // sharps: 0xfd  flats: 0x5f
      editEnabled: editAccidentals
      anchors {
        top: parent.top
        left: parent.left
        leftMargin: 12
      }

      onToggleBit: {
        accidentals ^= maskBit
        console.log("accidentals: " + accidentals.toString(2) + " maskBit: " + maskBit)
      }
    }
  }
}
