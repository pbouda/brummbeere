import QtQuick 2.3

Rectangle {
    property alias mouseArea: mouseArea

    color: "black"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Text {
        anchors.centerIn: parent
        color: "white"
        text: "Hello World"
    }
}
