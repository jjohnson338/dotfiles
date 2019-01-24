"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    oni.input.unbind("<s-c-b>");
    oni.input.bind("<space>d", "sidebar.toggle");
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //add custom config here, such as
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    //"oni.loadInitVim": false,
    //"editor.fontSize": "12px",
    //"editor.fontFamily": "Monaco",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.colorscheme": "onedark",
    // Editor customization
    "editor.fontSize": "14px",
    "editor.fontFamily": "Fira Code",
    //Version Control
    "experimental.vcs.sidebar": true
};
