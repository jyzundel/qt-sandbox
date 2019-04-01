import QtQuick 2.9
import "Styles"

Rectangle {
   id: test
   width: 200
   height: 100
   color: "cyan"

   Rectangle {
     color: "white"
     anchors {
       fill: parent
       margins: 10
     }

     Repeater {
       id: notes
       anchors {
         top: parent.top
         topMargin: StyleManager.lineHeight
         left: parent.left
         leftMargin: 50
       }
       model: 6
       delegate: Rectangle {
         id: noteRect
         height: StyleManager.noteHeight
         width: height // note.width
         radius: height * 0.5
         color: "black"
         anchors {
           top: notes.top
           topMargin: StyleManager.lineNoteHeight * index
           left: notes.left
         }
/*
         Text {
           id: note
           font.pixelSize: StyleManager.noteHeight
           text: "\u1D158"
           color: "black"
           anchors {
             verticalCenter: parent.verticalCenter
             left: parent.left
           }
         }
         */
       }
     }


     Repeater {
       id: spaceLabels
       anchors {
         top: parent.top
         topMargin: StyleManager.lineNoteHeight
         left: parent.left
       }

       model: ["G", "E", "C", "A", "F", "D"]
       delegate: Rectangle {
         id: spaceRect
         height: StyleManager.lineNoteHeight
         width: spaceLabel.width
         anchors {
           top: parent.top
           topMargin: height * index
           left: parent.left
         }

         Text {
           id: spaceLabel
           font.pixelSize: StyleManager.noteHeight * 0.8
           text: modelData
           color: "black"
           anchors {
             verticalCenter: parent.verticalCenter
             left: parent.left
             leftMargin: spaceLabel.font.pixelSize * 0.3
           }
         }
       }
     }

     StdLine {
       id: fLine
       lineWidth: 100
       label: "F"
       anchors {
         top: parent.top
         topMargin: StyleManager.lineNoteHeight * 0.5
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
