import QtQuick 2.9
import "Styles"

Item {
  id: root

  property int accidentalBits: 0xff
  property bool editEnabled: false
  //property bool showSharps: accidentalBits & (0x1 << 7)

  signal toggleBit(int maskBit)

  anchors.topMargin: StyleManager.lineNoteHeight * (internal.isSharp ? 3 : 2.5) - StyleManager.noteHeight * 0.1

  property var flatsModel: [
    { note: "f", x: 0, y: 0 }, { note: "e", x: 2, y: 0.5 }, { note: "d", x: 4, y: 1 }, { note: "c", x: 6, y: 1.5 },
      { note: "b", x: 1, y: 2 }, { note: "a", x: 3, y: 2.5 }, { note: "g", x: 5, y: 3 }
  ]

  property var sharpsModel: [
    { note: "f", x: 0, y: 1 },  { note: "g", x: 2, y: 0.5 },
      { note: "c", x: 1, y: 2.5}, { note: "d", x: 3, y: 2 },  { note: "e", x: 5, y: 1.5 },
                                    { note: "a", x: 4, y: 3.5}, { note: "b", x: 6, y: 3 }
  ]

  QtObject {
    id: internal

    property string flat: "\u266d"
    property string sharp: "\u266f"
    property int sharpBit: 0x1 << 7
    property int isSharp: accidentalBits & sharpBit
  }

  Repeater {
    id: unnaturals
    model: internal.isSharp ? sharpsModel : flatsModel
    delegate: SharpFlat {
      id: accidentalRect

      accidentalBits: root.accidentalBits
      bitIndex: modelData.note - 'a'
      editEnabled: root.editEnabled

      color: "transparent"
      border {
        width: 2
        color: internal.isSharp ? "blue" : "green"
      }
      x: modelData.x * StyleManager.lineNoteHeight
      y: modelData.y * StyleManager.lineNoteHeight

      onClickedSharpOrFlat: {
        toggleBit(maskBit)
      }

      Component.onCompleted: {
        console.log("note: " + modelData.note + " xy: [" + modelData.x + ", " + modelData.y + "]")
        console.log("    index: " + index + " bit: " + bitIndex)
      }
    }

  }
}
