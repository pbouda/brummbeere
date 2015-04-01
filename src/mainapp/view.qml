import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0

import "player.js" as PlayerCmd
import "UI.js" as UI

ApplicationWindow {
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
    width: 480
    height: 640
    title: "TwoMusic - ownCloud Music Player"


    TabView {
        id: tabView

        anchors.fill: parent
        anchors.margins: UI.margin
        tabPosition: UI.tabPosition

        Layout.minimumWidth: 480
        Layout.minimumHeight: 640
        Layout.preferredWidth: 480
        Layout.preferredHeight: 640

        Tab {
            title: "Settings"
            SettingsPage {
                //enabled: enabler.checked
            }
        }
        Tab {
            title: "Browser"
            BrowserPage {
                //enabled: enabler.checked
            }
        }
        Tab {
            title: "Player"
            PlayerPage {
                //enabled: enabler.checked
            }
        }
        Tab {
            title: "Exit"
            Button {
                text: "Exit app"
                onClicked: Qt.quit()
            }
        }
    }

    statusBar: StatusBar {
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: currentFolderName
            }
        }
    }
}


