
function toggleMenu() {
    if (!root.menuActive)
        root.menuActive = true;
    else
        root.menuActive = false;
}

function startAction(name, type) {
    if (type === "app") {
        if (name === "exit") Qt.quit();
    } else if (type === "page") {
        main.source = "qrc:/" + name + ".qml";
    }
    toggleMenu();
}
