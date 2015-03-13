import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

import "UI.js" as UI

ApplicationWindow {
    signal itemSelected(int index)
    visible: true
    width: 480
    height: 640
    title: "TwoMusic - ownCloud Music Player"

    MessageDialog {
        id: aboutDialog
        icon: StandardIcon.Information
        title: "About"
        text: "<b>TwoMusic</b> - ownCloud Music Player"
        informativeText: "<p>v0.0.1</p><p>A music player for ownCloud. Just browse to any folder and click play. \
            Developed by <a href=\"http://www.peterbouda.eu\">www.peterbouda.eu</a>. For bug \
            reports and suggestions please use <a href=\"https://github.com/pbouda/twomusic/issues\">the issue tracker</a>.</p>"
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem {
                text: "&Settings"
                //onTriggered: Qt.quit()
            }
            MenuItem {
                text: "E&xit"
                shortcut: StandardKey.Quit
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "&Help"
            MenuItem {
                text: "About..."
                onTriggered: aboutDialog.open()
            }
        }
    }

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
            title: "Browser"
            BrowserPage {
                enabled: enabler.checked
            }
        }

        Tab {
            title: "Player"
            PlayerPage {
                enabled: enabler.checked
            }
        }
    }

}


