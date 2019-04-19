import QtQuick 2.9
import "Styles"

Rectangle {
  id: stdStaff
  width: parent.width
  height: childrenRect.height
  color: "white"

  Column {
    id: lines
    width: parent.width
    spacing: StyleManager.noteHeight
    anchors {
      top: parent.top
      left: parent.left
    }

    Repeater {
      model: 5
      Rectangle {
        height: StyleManager.lineHeight
        color: "black"
        anchors {
          left: lines.left
          right: lines.right
        }
      }
    }
  }
}

/*
Item {
  id: stdStaff
  width: childrenRect.width
  height: childrenRect.height

  // properties
  property int extraLinesAbove: 0
  property int extraLinesBelow: 1
  property int noteHeight: 10
  property real noteWidth: 1.25 * noteHeight

  QtObject {
    id: internal
    property int lineHeight: 1
    property real ledgerLineWidth: noteWidth * 2.5
  }
  // javascript function
  // signals
  //noteEntered(string theNote)

  // components
  Rectangle {
    id: theStaff
    color: "white"
    width: noteWidth * 6
    height: childrenRect.height + 2 * noteHeight


    Column {
       id: theLines

       spacing: noteHeight

       // Ledger lines above
       Rectangle {
         id: eLedgerLine
         visible: extraLinesAbove > 2

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
      }

       Rectangle {
         id: cLedgerLine
         visible: extraLinesAbove > 1

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
       }

       Rectangle {
         id: aLedgerLine
         visible: extraLinesAbove > 0
         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
       }

       // Regular staff lines
       Item {
         id: fStaff
         width: childrenRect.width
         height: childrenRect.height
         anchors {
           left: parent.left
           right: parent.right
         }

         Text {
           id: fLabel
           text: qsTr("F")
           anchors.left: parent.left
         }

         Rectangle {
           id: fLine
           height: internal.lineHeight
           color: "black"
           anchors {
             left: fLabel.right
             right: parent.right
             verticalCenter: fLabel.verticalCenter
             leftMargin: 8
           }
         }
       }

       // Ledger lines below
       Rectangle {
         id: cLowerLedgerLine
         visible: extraLinesBelow > 0

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
        }

       Rectangle {
         id: aLowerLedgerLine
         visible: extraLinesBelow > 1

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
        }

       Rectangle {
         id: fLowerLedgerLine
         visible: extraLinesBelow > 2

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.horizontalCenter
        }

    } // end Column id: theLines



  } // end Rectangle id: theStaff

  // states
  // transitions

}
*/