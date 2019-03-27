import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12 // This was the only way I could get the ListView delegate to behave for me. Maybe you can help me understand the delegate component better.
import QtGraphicalEffects 1.12 // Needed to start playing around with things like drop shadows


Window {
    visible: true
    width: 360
    height: 640
    title: qsTr("Family List")

    Rectangle {
        id: abcRoot

        anchors.fill: parent
        color: "#EFF7FF"

        Rectangle {
            id: titleBar // This will be the title bar and utility nav

            width: parent.width
            height: 48
            color: "#00C06F"

            Text {
                id: title
                font.pixelSize: 20
                text: "Family List"
                color: "#FFFFFF"

                anchors.centerIn: parent
            }
        }

        DropShadow {
            anchors.fill: titleBar
            source: titleBar
            color: "#46000000"
            verticalOffset: 2
            radius: 4
        }

        Rectangle {
            id: fab // FAB or "Fast Action Button" for primary constructive action in the view

            width: 48
            height: 48
            radius: 24
            color: "#00C06F"

            anchors {
                right: parent.right
                rightMargin: 20
                bottom: parent.bottom
                bottomMargin: 20
            }

            Text {
                color: "#FFFFFF"
                font.pixelSize: 36
                text: "+"
                anchors.centerIn: parent // I believe the position is a little off because of the line spacing, but I ran out of time to investigate tonight.
            }
        }

        ListModel {
            id: sampleModel // Just some dummy data so I can play around with the ListView view a bit

            ListElement {
                givenName: "Deb"
                familyName: "Zundel"
                age: 62
            }

            ListElement {
                givenName: "Rob"
                familyName: "Zundel"
                age: 61
            }

            ListElement {
                givenName: "Danika"
                familyName: "Zundel-Perde"
                age: 39
            }

        }

        ListView {
            id: familyList // I definitely am at my limit with what I've done to this ListView

            anchors.top: titleBar.bottom
            anchors.topMargin: 8
            width: parent.width
            height: parent.height - titleBar.height // Good to see that basic mathematical operators work for this kind of stuff

            layoutDirection: verticalLayoutDirection
            spacing: 4

            model: sampleModel

            delegate: Rectangle {
/*
                // Doing some things with Layout in an attemt to get better control over list item positioning and formatting
                Layout.topMargin: 12
                Layout.leftMargin: 16
                Layout.rightMargin: 16
                Layout.preferredWidth: familyList.width - 32 // Honestly, I'm not entirely clear on how "preferredWidth" behaves
                Layout.preferredHeight: 76
*/
                width: parent.width - 16
                height: childrenRect.height

                // Basic formatting of the container elements for each list item
                color: "#E6EDF5"
                border.color: "#D7DEE5"
                border.width: 1
                radius: 4 // I was surprised to find that I can't specify independent corner radii (e.g. top-left: 8, top-right 20, etc.)
/*
                // Let's try some drop shadows on these rectangles to give them some depth
                // UPDATE: This didn't work, and I'm not sure why. It appears to have something to with either: A) nesting the drop shadow declaration in the element it's shadowing, or B) using drop shadows in delegates where there isn't a unique id to reference for the drop shadow.
                DropShadow {
                    width: parent.width
                    height: parent.height
                    source: parent
                    color: "#26000000"
                    verticalOffset: 6
                    radius: 12
                }
*/
                Text { // I think there's a lot I can do with Text, but I didn't really get into it this evening
                    padding: 6
                    font.pixelSize: 14
                    text: "Name: " + givenName + " " + familyName + "\n" + "Age: " + age
                }
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: fab  // Click anywhere on the FAB. Curious whether there's a way to ignore click events outside of the corner radius of the FAB.
            onClicked: {   // I updated some of this javascript. How do you feel about closing semicolons? Are they important when using JavaScript in QML?
                console.log("you clicked at " + mouse.x + ", " + mouse.y);
                hintTimer.restart();
                sampleModel.append({"givenName": "Julia", "familyName": "Harrison", "age": 38});
                console.log("Added " + sampleModel.get(sampleModel.count-1).givenName + " to the list.");
                // The hard-coded append data becomes obvious if you click the FAB multiple times, but I think this is fine for now. Maybe I'll try playing with user input next.
            }
        }

        Timer {
            id: hintTimer
            repeat: false
            interval: 8000  // milliseconds, so it will run for 8 seconds
            onTriggered: {  // this fires when the timer expires, 8 sec after you last click
                console.log("Let's keep working at this!");
            }
        }
    }
}

