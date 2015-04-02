import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0

Window {
    signal itemSelected(int index)
    property var currentTitle: "TwoMusic"
    property var menuActive: false
    property var playerMusic:
        MediaPlayer {
            property var currentAudio: 0
            property var playlist: []
            onStopped: {
                if (position > duration) PlayerCmd.next();
            }
        }

    id: root
    visible: true
    color: "black"


    TitleBar {
        id: titlebar
        anchors.top: parent.top
        width: parent.width
        height: 0.12*parent.height

    }

    Menu {
        id: menu
        anchors.top: titlebar.bottom
        anchors.bottom: taskbar.top
        width: parent.width
        visible: menuActive

    }

    Loader {
        id: main
        anchors.top: titlebar.bottom
        anchors.bottom: taskbar.top
        width: parent.width
        source: "qrc:/MainForm.qml"
        visible: !menuActive
    }

    TaskBar {
        id: taskbar
        anchors.bottom: parent.bottom
        width: parent.width
        height: 0.12*parent.height

    }

}
