import QtQuick 2.9
import "Styles"

Rectangle {
   id: test
   width: 600
   height: 300
   color: "cyan"

   QtObject {
     id: internal

     property string openNote: "\u1d15d"
     property string fillNote: "\u1d15f"
     property string flat: "\u266d"
     property string natural: "\u266e"
     property string sharp: "\u266f"

     property var notes: [openNote, fillNote, flat, natural, sharp]
   }

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
       model: 11
       delegate: IconSvg {
         id: noteSvg

         property real offsetX: index & 0x1 ? width : 0.0
         width: height * 1.2
         height: StyleManager.lineNoteHeight
         name: "note"
         color: index & 0x1 ? "red" : "black"
         anchors {
           top: notes.top
           topMargin: StyleManager.lineNoteHeight * index * 0.5
           left: notes.left
           leftMargin: offsetX
         }
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
/*
         IconSvg {
           id: aNoteIcon

           width: height * 1.2
           height: StyleManager.noteHeight
           name: "note"

           anchors {
             verticalCenter: parent.verticalCenter
             top: parent.top
             leftMargin: 25
           }
         }
*/
         Text {
           id: spaceLabel
           font.pixelSize: StyleManager.noteHeight
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
       lineWidth: 300
       label: "F"
       anchors {
         top: parent.top
         topMargin: StyleManager.lineNoteHeight * 0.5
         left: parent.left
       }
     }

     StdLine {
       id: dLine
       lineWidth: 300
       label: "D"
       anchors {
         top: fLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: bLine
       lineWidth: 300
       label: "B"
       anchors {
         top: dLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: gLine
       lineWidth: 300
       label: "G"
       anchors {
         top: bLine.bottom
         left: parent.left
       }
     }

     StdLine {
       id: eLine
       lineWidth: 300
       label: "E"
       anchors {
         top: gLine.bottom
         left: parent.left
       }
     }

   }

}
