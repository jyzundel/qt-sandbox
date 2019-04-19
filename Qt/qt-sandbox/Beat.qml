import QtQuick 2.9
import "Styles"

Repeater {
  id: beat
  property int notePattern: 0b110111111110111111111011
  model: 24
  delegate: Rectangle {
    property real offsetX: index & 0x1 ? width : 0.0
    width: height * 1.2
    height: StyleManager.noteHeight
    color: "transparent"
    anchors {
      bottom: beat.bottom
      bottomMargin: StyleManager.lineNoteHeight * index * 0.5 - 
        StyleManager.lineHeight
      left: beat.left
      leftMargin: offsetX
    }
    
    IconSvg {
      id: noteSvg
      name: "note"
      color: index & 0x1 ? "black" : "red"
      width: height * 1.2
      height: parent.height
      visible: (0x1 << index) & notePattern  
      anchors.centerIn: parent
    }

    Rectangle {
      id: ledgerLine
      height: StyleManager.lineHeight
      width: noteSvg.width * 1.2
      color: "black"
      visible: !(index & 0x1)
      anchors {
        verticalCenter: parent.verticalCenter
        horizontalCenter: parent.horizontalCenter
      }
    }
  }
}