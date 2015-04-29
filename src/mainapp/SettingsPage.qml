import QtQuick 2.0

Rectangle {
    color: "black"
    anchors.fill: parent
    id: settingsPage
    property alias ocUrl: url
    property alias ocUser: user
    property alias ocPassword: password

    Component.onCompleted: {
        taskbar.source = "qrc:/SettingsPageTaskBar.qml"
    }

    Row {
        anchors.fill: parent

        Rectangle {
            id: spacerLeft
            color: "black"
            height: parent.height
            width: parent.width*0.05
        }

        Column {
            width: parent.width*0.9

            Rectangle {
                color: "black"
                height: spacerLeft.width
                width: parent.width
            }

            Text {
                height: main.height/10
                width: parent.width
                font.pixelSize: height*0.6
                color: "white"
                text: "ownCloud URL"
            }

            Rectangle {
                color: "white"
                height: main.height/10
                width: parent.width

                TextInput {
                    anchors.centerIn: parent
                    height: parent.height-8
                    width: parent.width-8
                    font.pixelSize: parent.height*0.6
                    id: url
                    color: "black"
                    text: settings.url
                }
            }

            Rectangle {
                color: "black"
                height: spacerLeft.width
                width: parent.width
            }

            Text {
                height: main.height/10
                width: parent.width
                font.pixelSize: height*0.6
                color: "white"
                text: "Username"
            }

            Rectangle {
                color: "white"
                height: main.height/10
                width: parent.width

                TextInput {
                    anchors.centerIn: parent
                    height: parent.height-8
                    width: parent.width-8
                    font.pixelSize: parent.height*0.6
                    id: user
                    color: "black"
                    text: settings.user
                }
            }

            Rectangle {
                color: "black"
                height: spacerLeft.width
                width: parent.width
            }

            Text {
                height: main.height/10
                width: parent.width
                font.pixelSize: height*0.6
                color: "white"
                text: "Password"
            }

            Rectangle {
                color: "white"
                height: main.height/10
                width: parent.width

                TextInput {
                    anchors.centerIn: parent
                    height: parent.height-8
                    width: parent.width-8
                    font.pixelSize: parent.height*0.6
                    id: password
                    color: "black"
                    text: settings.password
                }
            }

        }  // Column

        Rectangle {
            color: "black"
            height: parent.height
            width: parent.width*0.05
        }

    } // Row


}

