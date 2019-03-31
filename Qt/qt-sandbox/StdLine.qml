import QtQuick 2.9

Item {
  id: stdLine
  width: childrenRect.width
  height: childrenRect.height

  property real lineHeight: 1
  property int labelHeight: 10

  Text {
    id: lineLabelText
    property alias lineLabel: lineLabelText.text
    font.pixelSize: labelHeight
    anchors.left: parent.left
  }

  Rectangle {
    id: line
    height: 1
    color: "black"
    anchors {
      left: label.right
      right: parent.right
      verticalCenter: label.verticalCenter
      leftMargin: 8
    }
  }
}
