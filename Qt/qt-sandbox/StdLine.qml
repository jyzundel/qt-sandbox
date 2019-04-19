import QtQuick 2.9
import "Styles"

Item {
  id: stdLine
  //width: childrenRect.width
  //height: childrenRect.height
  height: StyleManager.lineNoteHeight


  //property alias label: lineLabel.text
  property alias lineWidth: line.width

  Rectangle {
    id: line
    height: StyleManager.lineHeight
    color: "black"
    anchors {
      //left: parent.left
      verticalCenter: parent.verticalCenter
    }
  }
}
