import QtQuick 2.7

Rectangle {   // single line comment,
    id: abcRoot   // Qt Designer will make this italics.  Most things with an id (unique in the file)

    width: 300  // as the qml file referenced by qmlscene, the window will be 300x240
    height: 240
    color: "red"  // you can specify "#0800c0ff"to make a greenish blue, semi transparent
    radius: 20  // the corners will have radius of 20

    Text {
         id: label
         font.pixelSize: 24
         text: "Jeff Zundel"
         color: "#ffc000"  // ff is 255 in hex for red, c0 is some green, 00 is no blue, so orange
                                   // it is either RRGGBB or AARRGGBB

         anchors.centerIn: parent  // centers this in the parent rectangle
    }

    Text {
         id: subTitle
         visible: false   // this won't show up initially
         // visible: hintTImer.running  // Alt#1 (a little simpler)
         font.pixelSize: 12
         text: "Now you're on your way to developing"

         anchors {
             right: parent.right
             bottom: parent.bottom
             rightMargin: 8
             bottomMargin: 10
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent  // you can click anywhere in the root rectangle
        onClicked: {   // here's the little javascript
            console.log("you clicked at " + mouse.x + ", " + mouse.y)
            hintTimer.restart()
            subTitle.visible = true  // omit this with Alt#1
        }
    }

    Timer {
        id: hintTimer
        repeat: false
        interval: 8000  // milliseconds, so it will run for 8 seconds
        onTriggered: {  // this fires when the timer expires, 8 sec after you last click
            console.log("You have to keep working at it!")
            subTitle.visible = false  // omit this with Alt#1
        }
    }
}
