# 我的 Visual Studio Code 環境配置

Visual Studio Code 是我網頁開發的主要編輯器，好好打造編輯器的環境配置有助於提升開發效率，
這個 repo 整理了一些我個人喜好安裝的 Extensions、偏好設定、常用的 Shortcuts，
若未來需要重新配置環境的時候，可以作為參考依據，也可以在跟人聊到喜好配置的時候，方便與他人分享。

Visual Studio Code 已內建支援可以登入 GitHub 帳號來同步配置，詳細請見官方文件 [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync)。
雖然如此，我還是會在需要重新配置環境時，參考一下這份自己整理的 repo，可以重新檢視目前使用的套件跟設定是否還是有必要。

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

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)：

  可以直接在 Visual Studio Code 中看 Git 歷史及線圖。

- [Gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)：

  在 Visual Studio Code 中看某一行過去的修改內容以及是誰修改的等等。

- [Visual Studio Code Commitizen Support](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen)：

  自動產生 Conventional Commits 模板

### 增進開發效率

- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)：

  可以在 Visual Studio Code 中使用 Vim 快捷，達到少用滑鼠的目的。（目前嘗試中）

- [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)：

  如果是 React/Redux 開發者，這個套件已有創建好的 snippets，可以直接使用。

- [Jest Snippets](https://marketplace.visualstudio.com/items?itemName=andys8.jest-snippets)

  用 Jest 寫測試的話，這套 snippets 可以增加開發速度。

- [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode)

  可以即時在編輯器上顯示即時的執行結果，支援 JavaScript 和 TypeScript。

- [Thunder Client](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client)

  可以在 VSCode 內直接呼叫 REST api，不需要再另外使用 Postman。

- [live server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)：

  直接幫你起好一個 server，前端切版時即時更新，非常方便。

- [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks):

  在追蹤程式碼時，標記 tag，方便回頭快速找到標記的位置。

- [Multiple Clipboards for VSCode](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-multiclip)

  循環剪貼簿。

- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

  幫助 highlight 有註解 TODO 的地方。

- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)

  修改 Html tag 時，自動成對同步，不需修改兩遍。

### 維護程式碼品質

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)：

  搭配 Visual Studio Code 使用 ESLint。

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)：

  自動排版。

### 外觀

- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)：

  改變檔案的 icon，我覺得更漂亮，也更易辨別檔案類型。

- [Cobalt2 Theme Official](https://marketplace.visualstudio.com/items?itemName=wesbos.theme-cobalt2)

  我目前使用的 Theme。

### 其他

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)：

  檢查與提示拼字，支援駝峰式命名，減少變數命名的錯誤

- [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)：

  縮排顯示顏色，增加看程式碼時的可讀性。

- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)：

  追蹤使用 Visual Studio Code 開發時的時間分佈，方便時間管理及檢核效率。

## 全域配置設定

全域設定檔案：`settings.json`

請參考：[settings.json](https://github.com/twgd/myVSCode/blob/master/settings.json)

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
- [VSCode 如何提高我的寫扣效率 - Larry Lu](https://larrylu.blog/vscode-tips-fe3320f9032a)
