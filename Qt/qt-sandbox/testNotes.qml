import QtQuick 2.9
import "Styles"

Rectangle {
   id: test
   width: 200
   height: 100

   Rectangle {
     color: "transparent"
     anchors {
       fill: parent
       margins: 10
     }

     StdLine {
       id: fLine
       lineWidth: 100
       label: "F"
       anchors {
         top: parent.top
         topMargin: StyleManager.noteHeight
         left: parent.left
       }
     }

     StdLine {
       id: dLine
       lineWidth: 100
       label: "D"
       anchors {
         top: fLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: bLine
       lineWidth: 100
       label: "B"
       anchors {
         top: dLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: gLine
       lineWidth: 100
       label: "G"
       anchors {
         top: bLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: eLine
       lineWidth: 100
       label: "E"
       anchors {
         top: gLine.bottom
         left: parent.left
       }
     }

   }

}
