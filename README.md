# 我的 Visual Studio Code 環境配置

Visual Studio Code 是我網頁開發的主要編輯器，好好打造編輯器的環境配置有助於提升開發效率，
這個 repo 整理了一些我個人喜好安裝的 Extensions、偏好設定、常用的 Shortcuts，
若未來需要重新配置環境的時候，可以作為參考依據，也可以在跟人聊到喜好配置的時候，方便與他人分享。

雖然有套件可以做到同步 Visual Studio Code 的配置（[Sync Setting](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)），
但我還是喜歡在需要重新配置環境時，參考一下這份自己整理的 repo，可以重新檢視目前使用的套件跟設定是否還是有必要。

這份清單會隨著我個人的開發歷程持續調整，若看到這份清單的人，有什麼想法跟建議，也歡迎跟我分享。

我的開發系統環境主要是 macOS，這裡提到的 Shortcuts，主要以 macOS 為主。

---
Visual Studio Code 環境相關：

- [我的常用快捷鍵](https://github.com/twgd/myVSCode/blob/master/shortcuts.md)
---

## MAC 初始設定

在 Terminal 中使用 `code` 指令：

- `Cmd + Shift + P` 開啟命令列
- 輸入 `install` 關鍵字
- 按下 `Shell Command: Install ‘code’ command in PATH`

## 常用的 Extensions

對我來說，安裝套件最主要的目的之一，是要將開發的注意力專注在編輯器上，避免太頻繁切換視窗。

### Git 相關

- [git-autoconfig](https://marketplace.visualstudio.com/items?itemName=shyykoserhiy.git-autoconfig)：

  若習慣每個專案用 local 的 user 設定，這個套件非常方便設置與管理。

- [gitflow](https://marketplace.visualstudio.com/items?itemName=vector-of-bool.gitflow)：

  讓你在專案中依循 git flow 快速在命令列創建 branch。

- [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)：

  可以直接在 Visual Studio Code 中看 Git 歷史及線圖。

### 增進開發效率

- [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)：

  當同時有許多專案在開發時，可以快速在 Visual Studio Code 中切換專案。

- [Blueprint - New Files and Folders of Files from Templates](https://marketplace.visualstudio.com/items?itemName=teamchilla.blueprint)：

  當專案需要重複創建一包新的檔案時，可以先設置好樣板，之後就可自動幫你創建。

- [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)：

  如果是 React/Redux 開發者，這個套件已有創建好的 snippets，可以直接使用。

- [live server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)：

  直接幫你起好一個 server，前端切版時直接看到熱更新結果，非常方便。

- [live sass compiler](https://marketplace.visualstudio.com/items?itemName=ritwickdey.live-sass)：

  搭配 live server 一起用，直接幫你 compile SASS 成 CSS。

- [cdnjs](https://marketplace.visualstudio.com/items?itemName=JakeWilson.vscode-cdnjs)：

  在 Visual Studio Code 中快速引入 CDN，例如 jQuery。

- [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks):

  在追蹤程式碼時，標記 tag，方便回頭快速找到標記的位置。

### 維護程式碼品質

- [SCSS Refactoring](https://marketplace.visualstudio.com/items?itemName=lukazakrajsek.scss-refactoring)：

  幫助快速重構 SCSS，例如提取變數。

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)：

  搭配 Visual Studio Code 使用 ESLint。

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)：

  自動排版，幫助維持程式碼一慣風格，增加可讀性及維護性。

  但通常我不會在全域開啟儲存檔案時自動排版的功能，通常是手動輸入指令來自動排版：

  - 自動排版這個文件：`shift + alt + F`
  - 自動排版選取的部分：`cmd + K` 後按 `cmd + F`

- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)：

  如果團隊多人開發，大家不一定使用相同的編輯器，EditorConfig 可以作為不同編輯器間的共同設定。

### 外觀

- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)：

  改變檔案的 icon，我覺得更漂亮，也更易辨別檔案類型。

### 其他

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)：

  檢查與提示拼字，支援駝峰式命名，減少變數命名的錯誤

- [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)：

  縮排顯示顏色，增加看程式碼時的可讀性。

- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)：

  追蹤使用 Visual Studio Code 開發時的時間分佈，方便時間管理及檢核效率。

## 全域配置設定

全域設定檔案：`settings.json`

```json
{
  "window.zoomLevel": 0,
  "editor.tabSize": 2,
  "editor.formatOnSave": false,
  "editor.renderWhitespace": "boundary",
  "git-autoconfig.configList": [
    {
      "user.email": "user1@mail.com",
      "user.name": "user1"
    },
    {
      "user.email": "user2@mail.com",
      "user.name": "user2"
    }
  ],
  "workbench.iconTheme": "material-icon-theme",
  "files.autoSave": "onWindowChange",
  "files.defaultLanguage": "markdown",
  "liveServer.settings.donotShowInfoMsg": true,
  "workbench.startupEditor": "none",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

## 個別專案常用配置

設定檔案與路徑：`{{projectRoot}}/.vscode/settings.json`

通常跟 Prettier 有關的設定，我會依專案來配置，才不會影響到舊專案原先的設定。

```json
{
  "editor.formatOnSave": true,
  "prettier.singleQuote": true,
  "prettier.semi": true,
  "prettier.printWidth": 120,
  "prettier.trailingComma": "es5",
  "prettier.tabWidth": 2
}
```

### 說明：

`formatOnSave` 儲存時自動 format

`singleQuote` 使用單引號

`semi` 是否加分號

`printWidth` 行寬

`trailingComma` 物件結尾是否逗號

`tabWidth` 縮排空格

## 設定推薦安裝套件

若團隊協作專案，不一定每個人都已安裝好所需的套件，可以在專案裡配置建議的套件清單，提示協同開發的人安裝。

設定檔案與路徑：`{{projectRoot}}/.vscode/extensions.json`

```json
{
  "recommendations": ["{{projectID}}"]
}
```

## 參考資料來源

- [偏好的 Visual Studio Code 設定檔 - POY CHANG](https://poychang.github.io/my-vscode-config/)
- [2018 VS Code 設定大補帖與小技巧 - Ryan Hsu](https://medium.com/@mvpdw06/2018-vs-code-設定大補帖與小技巧-24c6269b0cc1)
