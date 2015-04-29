import QtQuick 2.0

import "helpers.js" as Helpers

Rectangle {
    color: "black"

    TaskBarButton {
        id: button1
        width: parent.width/2 - 2
        icon: "qrc:/images/icon_cancel.png"

        MouseArea {
            anchors.fill: parent
            onClicked: Helpers.toggleMenu()
        }
    }

    TaskBarButton {
        id: button2
        anchors.left: button1.right
        width: parent.width/2 - 2
        anchors.leftMargin: 4
        icon: "qrc:/images/icon_ok.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Helpers.saveSettings();
                Helpers.toggleMenu();
                Helpers.initOwncloud();
            }
        }
    }

}

