import QtQuick 2.0

Rectangle {
    property string icon: ""

    color: "#ec3f8c"
    radius: 5
    height: parent.height

    Image {
        id: buttonImageLeft
        anchors.centerIn: parent
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: icon
    }

}


