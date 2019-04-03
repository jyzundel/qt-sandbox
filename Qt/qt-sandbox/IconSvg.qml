import QtQuick 2.9

Item {
  id: root

  property string name: undefined

  Image {
    source: "Images/" + name + ".svg"
    fillMode: Image.Stretch  // Image.PreserveAspectFit
    smooth: true

    anchors.fill: parent
  }

}
