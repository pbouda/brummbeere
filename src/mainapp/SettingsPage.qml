import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

ColumnLayout {
    anchors.fill: parent
    Layout.minimumWidth: 480
    Layout.minimumHeight: 640
    Layout.preferredWidth: 480
    Layout.preferredHeight: 640

    GridLayout {
        anchors.fill: parent
        columns: 2

        Label {
            text: "<b>ownCloud Settings</b>"
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.columnSpan: 2
        }

        Label { text: "ownCloud Server URL:" }
        TextField {
            id: ownCloudUrl
            Layout.fillWidth: true
            text: currentFolderModel.davSettings[0]
        }
        Label { text: "Username:" }
        TextField {
            id: ownCloudUser
            Layout.fillWidth: true
            text: currentFolderModel.davSettings[1]
        }
        Label { text: "Password:" }
        TextField {
            id: ownCloudPass
            echoMode: TextInput.Password
            Layout.fillWidth: true
            text: currentFolderModel.davSettings[2]
        }
        //CheckBox {
        //    id: storePassword
        //    text: "Store password?"
        //    Layout.columnSpan: 2
        //}
        Button {
            id: saveButton
            text: "Save"
            Layout.columnSpan: 2
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                currentFolderModel.initDav(ownCloudUrl.text, ownCloudUser.text, ownCloudPass.text);
                currentFolderModel.loadFromDir("/");
                root.currentFolderName = "/";
            }
        }
    }
}

