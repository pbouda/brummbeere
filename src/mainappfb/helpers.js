
function toggleMenu() {
    if (!root.menuActive) {
        menuButton.border.width = 4;
        root.menuActive = true;
        menu.visible = true;
        main.visible = false;
    } else {
        menuButton.border.width = 0;
        root.menuActive = false;
        menu.visible = false;
        main.visible = true;
    }
}

