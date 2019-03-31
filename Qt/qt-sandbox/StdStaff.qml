import QtQuick 2.9

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
         anchors.horizontalCenter: parent.HorizontalCenter
      }

       Rectangle {
         id: cLedgerLine
         visible: extraLinesAbove > 1

         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.HorizontalCenter
       }

       Rectangle {
         id: aLedgerLine
         visible: extraLinesAbove > 0
         height: internal.lineHeight
         width: internal.ledgerLineWidth
         color: "black"
         anchors.horizontalCenter: parent.HorizontalCenter
       }

       // Regular staff lines
       Item {
         id: fStaff
         anchors {
           left: parent.left
           right: parent.right
         }

         Text {
           id: fLabel
           text: qsTr("F")
           width: 10
           anchors.left: parent.left
         }

         Rectangle {
           id: fLine
           height: internal.lineHeight
           color: "black"
           anchors {
             left: parent.left
             right: parent.right
           }
         }
       }
/*
       Rectangle {
         id: dLine
         height: internal.lineHeight
         color: "black"
         anchors {
            left: parent.left
            right: parent.right
          }
         Text {
           id: dLabel
           text: qsTr("D")
         }
        }

       Rectangle {
         id: bLine
         height: internal.lineHeight
         color: "black"
         anchors {
            left: parent.left
            right: parent.right
          }
         Text {
           id: bLabel
           text: qsTr("B")
         }
        }

       Rectangle {
         id: gLine
         height: internal.lineHeight
         color: "black"
         anchors {
            left: parent.left
            right: parent.right
          }
         Text {
           id: gLabel
           text: qsTr("G")
         }
        }

       Rectangle {
         id: eLine
         height: internal.lineHeight
         color: "black"
         anchors {
            left: parent.left
            right: parent.right
          }
         Text {
           id: eLabel
           text: qsTr("E")
         }
        }
*/
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
