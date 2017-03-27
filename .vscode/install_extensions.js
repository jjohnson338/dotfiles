/**
 * This script queries installed vscode
 * extensions and compares them against 
 * a list of desired extensions. It will
 * then install all extensions that aren't
 * installed.
 */

const execSync = require('child_process').execSync;
const spawnSync = require('child_process').spawnSync;
const defaultOptions = {
     stdio: 'pipe',
     maxBuffer: 1024 * 1000,
};

const desiredExtensions = [
    'christian-kohler.npm-intellisense',
    'christian-kohler.path-intellisense',
    'dbaeumer.vscode-eslint',
    'mohsen1.prettify-json',
    'PKief.material-icon-theme',
    'waderyan.gitblame',
    'zhuangtongfa.Material-theme'
];

const installedExtensions = execSync("code --list-extensions").toString().split("\n").filter((y) => {
    return y != "";
});


const notInstalledDesiredExtensions = desiredExtensions.map((y) => {
    if(installedExtensions.filter((x) => {
        return y == x;
    }).length == 0) {
        return y;
    }
}).filter((z) => {
    return z != null;
});

for(let extension in notInstalledDesiredExtensions) {    
    execSync(`code --install-extension ${notInstalledDesiredExtensions[extension]}`);
}