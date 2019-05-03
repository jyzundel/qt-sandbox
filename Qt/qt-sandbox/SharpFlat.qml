import QtQuick 2.0

Rectangle {
  id: sharpOrFlat

  property int accidentalBits: 0xff
  property int bit: 0

  QtObject {
    id: internal

    property string flat: "\u266d"
    property string sharp: "\u266f"
    property int sharpBit: 0x1 << 7
    property int isSharp: accidentalBits & sharpBit
    property int maskBit: 0x1 << bit
  }

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
    font.pixelSize: 24
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
  }
}
