import QtQuick 2.9

Item {
  id: stdLine
  width: childrenRect.width
  height: childrenRect.height

  Text {
    id: label
    text: qsTr(" ")
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
