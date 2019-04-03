import QtQuick 2.9
import QtGraphicalEffects 1.12

Item {
  id: root

  property string name: undefined
  property color color: "black"

  Image {
    id: theIcon
    source: "Images/" + name + ".svg"
    sourceSize: Qt.size(root.width, root.height)
    fillMode: Image.Stretch  // Image.PreserveAspectFit
    smooth: false

    anchors.fill: parent
  }

  ColorOverlay {
    anchors.fill: theIcon
    source: theIcon
    color: root.color
  }



}
