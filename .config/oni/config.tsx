import * as React from "react"
import * as Oni from "oni-api"

interface ISidebar {
    sidebar: {
        activeEntryId: string
        isFocused: boolean
    }
}

export const activate = (oni: Oni.Plugin.Api) => {
    const { editors, menu } = oni;

	const isVisualMode = () => editors.activeEditor.mode === "visual";
    const isNormalMode = () => editors.activeEditor.mode === "normal";
    const isNotInsertMode = () => editors.activeEditor.mode !== "insert";
    const isInsertOrCommandMode = () =>
        editors.activeEditor.mode === "insert" || editors.activeEditor.mode === "cmdline_normal";

    const oniWithSidebar = oni as Oni.Plugin.Api & ISidebar
    const isSidebarPaneOpen = (paneId: string) =>
        oniWithSidebar.sidebar.activeEntryId === paneId &&
        oniWithSidebar.sidebar.isFocused &&
        !isInsertOrCommandMode() &&
        !isMenuOpen();

    const isExplorerActive = () => isSidebarPaneOpen("oni.sidebar.explorer");
    const isVCSActive = () => isSidebarPaneOpen("oni.sidebar.vcs");

    const isMenuOpen = () => menu.isMenuOpen();

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
    oni.input.bind("gd", "language.gotoDefinition", () => isNormalMode() && !menu.isMenuOpen())
}


export const configuration = {
    //add custom config here, such as

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "ui.colorscheme":"onedark",

    // Editor customization
    "editor.fontSize": "14px",
    "editor.fontFamily": "Fira Code",
    "editor.renderer": "webgl",
    "autoClosingPairs.enabled": false,
    "experimental.indentLines.enabled": true,
    "tabs.height": "1.5em",
    "sidebar.width": "20em",
    "statusbar.fontSize": "1.0em",

    //Version Control
    "experimental.vcs.sidebar": true,
}
