import QtQuick 2.0
import "Styles"

Item {
  id: root

  property var flatsModel: [
    { note: "f", x: 0, y: 0 }, { note: "e", x: 2, y: 0.5 }, { note: "d", x: 4, y: 1 }, { note: "c", x: 6, y: 1.5 },
      { note: "b", x: 1, y: 2 }, { note: "a", x: 3, y: 2.5 }, { note: "g", x: 5, y: 3 }
  ]

  property var sharpsModel: [
    { note: "f", x: 0, y: 1 },  { note: "g", x: 2, y: 0.5 },
      { note: "c", x: 1, y: 2.5}, { note: "d", x: 3, y: 2 },  { note: "e", x: 5, y: 1.5 },
                                    { note: "a", x: 4, y: 3.5}, { note: "b", x: 6, y: 3 }
  ]

  property int accidentalBits: 0xff
  property bool showSharps: accidentalBits & (0x1 << 7)

  anchors.topMargin: StyleManager.lineNoteHeight * (showSharps ? 3 : 2.5) - StyleManager.noteHeight * 0.1

  Repeater {
    id: unnaturals
    model: showSharps ? sharpsModel : flatsModel
    delegate: Rectangle {
      id: accidentalRect
      property int bit: modelData.note - 'a'
      width: StyleManager.noteHeight * 1.2
      visible: accidentalBits & (0x1 << bit)
      height: width * (showSharps ? 1.0 : 2.0)
      color: "transparent"
      border {
        width: 2
        color: showSharps ? "blue" : "green"
      }
      x: modelData.x * StyleManager.lineNoteHeight
      y: modelData.y * StyleManager.lineNoteHeight

      Component.onCompleted: {
        console.log("note: " + modelData.note + " xy: [" + modelData.x + ", " + modelData.y + "]")
        console.log("    index: " + index + " bit: " + bit)
      }
    }

  }
}
