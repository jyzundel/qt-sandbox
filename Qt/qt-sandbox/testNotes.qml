import QtQuick 2.9

Rectangle {
   id: test
   width: childrenRect.width
   height: childrenRect.height


   Row {
     id: staffs
     spacing: 0
     anchors.fill: parent

     StdStaff {
         id: chord1
         noteHeight: 12
     }
/*
     StdStaff {
       id: chord2
     }
     */
   }
}
