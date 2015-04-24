import QtQuick 2.0

ListView {

    model: root.playerMusic.currentPlaylist

    Component.onCompleted: {
        taskbar.source = "qrc:/PlayerPageTaskBar.qml"
    }

    delegate: Rectangle {
        height: menu.height/10
        width: menu.width
        color: "black"

        Text {
            id: listText
            text: {
                var parts = modelData.split("/");
                return parts[parts.length-1];
            }
            anchors.leftMargin: parent.width*0.05
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: parent.height*0.6
            color: "white"
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "white"
            anchors.bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
            }
        }

    }
}


