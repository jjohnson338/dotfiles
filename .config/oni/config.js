"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    var editors = oni.editors, menu = oni.menu;
    var isVisualMode = function () { return editors.activeEditor.mode === "visual"; };
    var isNormalMode = function () { return editors.activeEditor.mode === "normal"; };
    var isNotInsertMode = function () { return editors.activeEditor.mode !== "insert"; };
    var isInsertOrCommandMode = function () {
        return editors.activeEditor.mode === "insert" || editors.activeEditor.mode === "cmdline_normal";
    };
    var oniWithSidebar = oni;
    var isSidebarPaneOpen = function (paneId) {
        return oniWithSidebar.sidebar.activeEntryId === paneId &&
            oniWithSidebar.sidebar.isFocused &&
            !isInsertOrCommandMode() &&
            !isMenuOpen();
    };
    var isExplorerActive = function () { return isSidebarPaneOpen("oni.sidebar.explorer"); };
    var isVCSActive = function () { return isSidebarPaneOpen("oni.sidebar.vcs"); };
    var isMenuOpen = function () { return menu.isMenuOpen(); };
    // Input
    //FileExplorer
    oni.input.unbind("<space>");
    oni.input.unbind("o");
    oni.input.unbind("<s-c-b>");
    oni.input.bind("<space>d", "explorer.toggle", isNotInsertMode);
    oni.input.unbind("d");
    oni.input.bind("md", "explorer.delete", isExplorerActive);
    oni.input.unbind("r");
    oni.input.bind("mm", "explorer.rename", isExplorerActive);
    oni.input.unbind("<c-e>");
    oni.input.bind("ma", "explorer.create.file", isExplorerActive);
    oni.input.bind("o", "explorer.expand.directory", isExplorerActive);
    oni.input.bind("o", "explorer.collapse.directory", isExplorerActive);
    oni.input.unbind("<f12>");
    oni.input.bind("gd", "language.gotoDefinition", function () { return isNormalMode() && !menu.isMenuOpen(); });
};
exports.configuration = {
    //add custom config here, such as
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.colorscheme": "onedark",
    // Editor customization
    "editor.fontSize": "13px",
    "editor.fontFamily": "Fira Code",
    "editor.renderer": "webgl",
    "autoClosingPairs.enabled": false,
    "experimental.indentLines.enabled": true,
    "tabs.height": "1.5em",
    "sidebar.width": "20em",
    "statusbar.fontSize": "1.0em",
    //Version Control
    "experimental.vcs.sidebar": true
};
