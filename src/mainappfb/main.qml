import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0

Window {
    signal itemSelected(int index)
    property var currentFolderName: "Connect to ownCloud - please add settings"
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


    TitleBar {
        id: titlebar
        anchors.top: parent.top
        width: parent.width

    }

    MainForm {
        id: main
        anchors.top: menu.bottom
        anchors.bottom: tasks.top
        width: parent.width

        mouseArea.onClicked: {
            Qt.quit();
        }

    }

    TaskForm {
        id: taskbar
        anchors.bottom: parent.bottom
        width: parent.width

    }

}
