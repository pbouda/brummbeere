import QtQuick 2.0


ListView {
    model: MenuContent {}

    delegate: Text {
        id: menuText
        text: name
        font.pixelSize: (parent.height/5)*0.6
        color: "white"

    }
}
