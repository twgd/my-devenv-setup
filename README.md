# My MacBook Setup for Web Development

受到 [這篇文章](https://www.robinwieruch.de/mac-setup-web-development/) 的啟發，決定在這裡記錄我作為網頁開發的筆電環境配置。

從備份到逐步設定環境、下載所需的應用程式等等，依先後次序紀錄，列出所需的項目，供未來換機或設定新設備的時候對照。

雖然開發環境的配置可以仰賴自動化，但是換機或是配置新電腦的機會並不頻繁，所以我目前還是偏好每次都手動配置，並定期更新這份工具清單，好確認每項工具的配置方式是否過時？是否符合現階段的開發需求？

儘管如此，備份的部分，目前盡可能善用自動同步及自動化批次備份，未來會朝向嘗試讓更多配置的步驟自動化。

## Backup Checklist

- [ ] iCloud 備份
- [ ] Google 備份
- [ ] 本機的 repos 同步到 Github
- [ ] Brave browser 與手機同步
  - Extensions
  - bookmarks
  - tabs
- [ ] Notion
  - 使用 [notion-backup](https://github.com/darobin/notion-backup) 及 Github Actions 自動化批次備份（每天一次）。
- [ ] dot files
  - .zshrc (備份到 [my-devenv-setup/dotfiles](https://github.com/twgd/my-devenv-setup/tree/master/dotfiles))
  - .gitconfig (備份到 [my-devenv-setup/dotfiles](https://github.com/twgd/my-devenv-setup/tree/master/dotfiles))
- [ ] VScode 以 Github 帳號同步
  - settings.json (也備份到 [my-devenv-setup/vscode](https://github.com/twgd/my-devenv-setup/tree/master/vscode))
  - extensions
  - snippets

## OS Settings

- 登入
  - apple ID / iCloud
- 系統偏好設定
  - 一般：深色模式
  - 指揮中心：熱點
  - Finder：顯示副檔名
  - 鍵盤：
    - 快速鍵
    - 輸入法：注音、英文、日文
  - 觸控板：Tap to Click
  - 日期與時間：顯示秒數
  - Time Machine
- 辭典

## Browser Settings

- 下載
  - Brave (預設)
  - Chrome
  - Edge
  - Firefox
  - Tor (私密瀏覽)
- 登入
  - Google
  - Github
- 同步 Brave 的 bookmarks & tabs
- 偏好設定
  - dark mode
- Extensions
  - React dev tools
  - SurfShark (需登入)

## Symlink DotFiles

參考：[Dotfiles – What is a Dotfile and How to Create it in Mac and Linux](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)

- 下載 repo: [my-devenv-setup](https://github.com/twgd/my-devenv-setup)
- 使用 `ln -s` 軟連結指令，將 repo 內的 dotFiles 連結到 `~/` 資料夾內的 dotFiles

```shell
ln -s ~/dotfiles/.zshrc  ~/.zshrc
```

將 `~/dotfiles/` 資料夾內的 dotFiles 與 `~/` 資料夾內的 dotFiles 設置軟連結的目的是：

當我們修改 `~/` 內的 dotFiles 時，會同步更新所連結的 `~/dotfiles/` 內的檔案，
這樣我們可以透過將 `~/dotfiles/` 利用 Git 做版本控制，達到統一管理並同步 dotFiles 到 Github 的目的。

未來還可以寫一個 script，透過 crontabs 執行，達到自動同步的功能。

## Setup Terminal

參考：[超簡單！十分鐘打造漂亮又好用的 zsh command line 環境 ](https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f)

- Homebrew
- iTerm2
  - 下載並配置 [color schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
  - 下載並配置 powerline font (icon)
- Zsh (bash replacement) + Oh-My-Zsh (Zsh framework)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) (zsh theme) & set up
- htop

## Dev Environments

- Git
  - 配置 global config
- nvm + yarn
- SSH key
  - 設置 Github SSH key，以 SSH 與 Github 連線
- [commitzen](https://commitizen-tools.github.io/commitizen/)
- Postman (需登入)

## Visual Studio Code

Visual Studio Code 是我網頁開發的主要編輯器，好好打造編輯器的環境配置有助於提升開發效率，
這裡整理了一些我安裝的 Extensions、偏好設定、常用的 Shortcuts，
若未來需要重新配置環境的時候，可以作為參考依據，另外也方便與他人分享。

Visual Studio Code 已內建支援可以登入 GitHub 帳號來同步配置，詳細請見官方文件 [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync)。
雖然如此，我還是會在需要重新配置環境時，參考一下這份清單，可以重新檢視目前使用的套件跟設定是否還是有必要。

這份清單會隨著我個人的開發歷程持續調整，若看到這份清單的人，有什麼想法跟建議，也歡迎跟我分享。

我的開發系統環境主要是 macOS，這裡提到的 Shortcuts，主要以 macOS 為主。

### MAC 初始設定

- 在 Terminal 中使用 `code` 指令：
  - `Cmd + Shift + P` 開啟命令列
  - 輸入 `install` 關鍵字
  - 按下 `Shell Command: Install ‘code’ command in PATH`
- 登入 Github 同步設定

### 常用的 Extensions

對我來說，安裝套件最主要的目的之一，是要將開發的注意力專注在編輯器上，避免太頻繁切換視窗。

#### Git 相關

- [git-autoconfig](https://marketplace.visualstudio.com/items?itemName=shyykoserhiy.git-autoconfig)：

  若習慣每個專案用 local 的 user 設定，這個套件非常方便設置與管理。

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)：

  可以直接在 Visual Studio Code 中看 Git 歷史及線圖。

- [Gitlens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)：

  在 Visual Studio Code 中看某一行過去的修改內容以及是誰修改的等等。

- [Visual Studio Code Commitizen Support](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen)：

  自動產生 Conventional Commits 模板

#### 增進開發效率

- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)：

  可以在 Visual Studio Code 中使用 Vim 快捷，達到少用滑鼠的目的。（目前嘗試中）

- [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)：

  如果是 React/Redux 開發者，這個套件已有創建好的 snippets，可以直接使用。

- [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest)

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

- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)

  Tailwind CSS 的提示。

- [MDX](https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-mdx)

- [Sass](https://marketplace.visualstudio.com/items?itemName=Syler.sass-indented)

- [Prisma](https://marketplace.visualstudio.com/items?itemName=Prisma.prisma)

#### 維護程式碼品質

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)：

  搭配 Visual Studio Code 使用 ESLint。

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)：

  自動排版。

#### 外觀

- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)：

  改變檔案的 icon，我覺得更漂亮，也更易辨別檔案類型。

- [Cobalt2 Theme Official](https://marketplace.visualstudio.com/items?itemName=wesbos.theme-cobalt2)

  我目前使用的 Theme。

#### 其他

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)：

  檢查與提示拼字，支援駝峰式命名，減少變數命名的錯誤

- [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)：

  縮排顯示顏色，增加看程式碼時的可讀性。

- [WakaTime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)：

  追蹤使用 Visual Studio Code 開發時的時間分佈，方便時間管理及檢核效率。

- [DotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)

  highlight `.env` 檔案。

- [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)

- [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)

### 全域配置設定及快捷鍵

- 全域設定檔案：[settings.json](https://github.com/twgd/my-devenv-setup/blob/master/vscode/settings.json)

- [我的常用快捷鍵](https://github.com/twgd/my-devenv-setup/blob/master/vscode/shortcuts.md)

### 設定推薦安裝套件

若團隊協作專案，不一定每個人都已安裝好所需的套件，可以在專案裡配置建議的套件清單，提示協同開發的人安裝。

設定檔案與路徑：`{{projectRoot}}/.vscode/extensions.json`

```json
{
  "recommendations": ["{{projectID}}"]
}
```

## Others

- 下載 JetBrains Toolbox 並登入帳號，安裝以下軟體：
  - WebStorm
  - IntelliJ Rust

## Install Apps

- Dropbox (login)
- Spotify (login)
- Zoom
- Line (login)
- Slack (login)
- Discord (login)
- Telegram (login)
- SurfShark (login)
- BeFocused
- RescueTime (login)
- Notion (login)
- Figma (login)

---

參考資料來源：

- [Mac Setup for Web Development [2022]](https://www.robinwieruch.de/mac-setup-web-development/)
- [偏好的 Visual Studio Code 設定檔 - POY CHANG](https://poychang.github.io/my-vscode-config/)
- [2018 VS Code 設定大補帖與小技巧 - Ryan Hsu](https://medium.com/@mvpdw06/2018-vs-code-設定大補帖與小技巧-24c6269b0cc1)
- [VSCode 如何提高我的寫扣效率 - Larry Lu](https://larrylu.blog/vscode-tips-fe3320f9032a)
