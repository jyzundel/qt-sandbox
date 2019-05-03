import QtQuick 2.9
import "Styles"

Rectangle {
  id: sharpOrFlat

  property int accidentalBits: 0xff
  property int bitIndex: 0
  property bool editEnabled: false

  signal longPressed()

  QtObject {
    id: internal

    property string flat: 'b' //"\u266d"
    property string sharp: '#' // "\u266f"
    property int sharpBit: 0x1 << 7
    property int isSharp: accidentalBits & sharpBit
    property int maskBit: 0x1 << bitIndex
  }

  visible: editEnabled || accidentalBits & (0x1 << bitIndex)
  width: StyleManager.noteHeight * 1.2
  height: width * (internal.isSharp ? 1.0 : 2.0)
  //width: bitsType.width
  //height: bitsType.height
  color: "cyan"
  z: 2

//  anchors {
//    left: parent.left
//    right: parent.right
//    margins: 10
//  }

  Text {
    id: bitsType
    font.pixelSize: parent.height
    color: "black"
    text: internal.isSharp ? internal.sharp : internal.flat
    anchors.fill: parent
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      accidentalBits ^= internal.maskBit
      console.log("sharp: " + internal.isSharp + " " + accidentalBits.toString(2))
    }
    onPressAndHold: {
      longPressed()
    }
  }
}
