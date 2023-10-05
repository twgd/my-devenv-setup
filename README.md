# My MacBook Setup for Web Development

受到 [這篇文章](https://www.robinwieruch.de/mac-setup-web-development/) 的啟發，決定在這裡記錄我作為網頁開發的筆電環境配置。

從備份到逐步設定環境、下載所需的應用程式等等，依先後次序紀錄，列出所需的項目，供未來換機或設定新設備的時候對照。

雖然開發環境的配置可以仰賴自動化，但是換機或是配置新電腦的機會並不頻繁，所以我目前還是偏好每次都手動配置，並定期更新這份工具清單，好確認每項工具的配置方式是否過時？是否符合現階段的開發需求？

儘管如此，備份的部分，目前盡可能善用自動同步及自動化批次備份，未來會朝向嘗試讓更多配置的步驟自動化。

## 前置作業：Backup Checklist

- [ ] Time Machine 備份
- [ ] iCloud 備份
- [ ] Google 備份
- [ ] Dropbox 備份
- [ ] 本機的 repos 同步到 Github
- [ ] 瀏覽器備份與同步
- [ ] dot files 備份到 [my-devenv-setup/dotfiles](https://github.com/twgd/my-devenv-setup/tree/master/dotfiles)
- [ ] VScode 以 Github 帳號同步備份 (settings.json 也另外備份到 [my-devenv-setup/vscode](https://github.com/twgd/my-devenv-setup/tree/master/vscode))
- [ ] Raycast 匯出備份
- [ ] Notion 備份：使用 [notion-backup](https://github.com/darobin/notion-backup) 及 Github Actions 自動化批次備份（每天一次）

## OS Settings

- 登入 Apple ID / iCloud
- 登入 Google 帳號 (行事曆)
- 系統偏好設定
  - 一般
    - 外觀：深色模式
  - Dock 與選單列
    - 在 Dock 中顯示最近使用過的應用程式 -> off
    - 為開啟的應用程式顯示指示燈 -> on
    - 電池 -> 顯示百分比
  - 鍵盤：
    - 快速鍵
      - 取消大部分快速鍵 (以 Raycast 取代)
      - 輸入方式：選擇上一個輸入方式 -> on (^空白鍵)
      - 截圖 -> on
    - 輸入方式：繁體注音、英文、日文 - 羅馬字
  - 觸控式軌跡板：
    - 點一下選按 -> on
  - 指揮中心：
    - 熱點：
      - 右上：桌面
      - 左上：讓顯示器進入睡眠
      - 右下：鎖定螢幕
      - 左下：鎖定螢幕
  - 共享：關閉所有
  - 日期與時間：顯示秒數
  - Time Machine
- Finder 偏好設定：
  - 側邊欄：喜好項目 -> 顯示所有項目
  - 標籤：隱藏所有標籤
  - 進階：顯示所有檔案副檔名 -> on
- 辭典設定：中英文、日英文

## Homebrew

1. 下載 [Homebrew](https://brew.sh/)

2. 使用 Homebrew 下載套件 (formulae)：

```shell
brew install \
  wget \
  htop \
  git \
  zsh \
```

3. 使用 Homebrew 下載 GUI Apps (casks)

```shell
brew install --cask \
  dropbox \
  zoom \
  discord \
  telegram \
  surfshark \
  rescuetime \
  raycast \
  brave-browser \
  google-chrome \
  microsoft-edge \
  firefox \
  Vivaldi \
  tor-browser \
  arc \
  iterm2 \
  visual-studio-code \
  jetbrains-toolbox \
  termius \
  tailscale
```

- Dropbox
- Zoom
- Discord
- Telegram
- SurfShark
- RescueTime
- Raycast
- Browsers
  - Brave
  - Chrome
  - Edge
  - Firefox
  - Vivaldi
  - Tor
  - Arc Browser (YouTube, Spotify, Notion, Slack, Figma, Twitter, Gmail)
- iTerm2
- Visual Studio Code
- JetBrains Toolbox
- Termius
- Tailscale

## Browser Settings

1. Arc 設為預設瀏覽器
2. 同步 bookmarks & tabs & extensions
3. 登入 Google & GitHub
4. 偏好設定：dark mode

- Extensions
  - React dev tools
  - SurfShark
  - Wappalyzer - Technology profiler
  - HTML5 Outliner

## Symlink DotFiles

- 參考：[Dotfiles – What is a Dotfile and How to Create it in Mac and Linux](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)

1. 下載 repo: [my-devenv-setup](https://github.com/twgd/my-devenv-setup)
2. 使用 `ln -s` 軟連結指令，將 repo 內的 dotFiles 連結到 `~/` 資料夾內的 dotFiles

```shell
ln -s ~/dotfiles/.zshrc  ~/.zshrc
```

將 `~/dotfiles/` 資料夾內的 dotFiles 與 `~/` 資料夾內的 dotFiles 設置軟連結的目的是：

當我們修改 `~/` 內的 dotFiles 時，會同步更新所連結的 `~/dotfiles/` 內的檔案，這樣我們可以透過將 `~/dotfiles/` 利用 Git 做版本控制，達到統一管理並同步 dotFiles 到 Github 的目的。

未來還可以寫一個 script，透過 crontabs 執行，達到自動同步的功能。

## Raycast Settings

- 匯入 Raycast 偏好設定備份

## Setup Terminal

- 參考：[超簡單！十分鐘打造漂亮又好用的 zsh command line 環境 ](https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f)

1. 配置 iTerm2 的 Color Presets：下載並匯入 [color schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)，選擇 Tomorrow Night Eighties 作為 iTerm2 的 Color Presets

2. 配置 Zsh (bash replacement) 為預設 shell：確認 Zsh 已下載安裝完成，並將 Zsh 設為預設 shell

3. 安裝 Oh-My-Zsh (Zsh framework)：到 [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 下載安裝

4. 安裝 powerlevel10k (zsh theme)：到 [powerlevel10k](https://github.com/romkatv/powerlevel10k) 下載安裝並配置。用 iTerm2 運行 `p10k configure` 會自動下載推薦的 Nerd Font (支援特殊 icon 的字型)

## Dev Environments

1. 確認 Git 已下載，並確認 global config 檔案也配置完畢

2. 下載 nvm 並配置：到 [nvm](https://github.com/nvm-sh/nvm) 下載安裝（Homebrew 不支援下載），並確認 `~/.zshrc` 檔案的配置

3. 使用 nvm 下載 node.js 後，下載 [pnpm](https://pnpm.io/installation) 及 yarn （開發套件管理工具）

4. 設置 Github SSH key，以 SSH 與 Github 連線：參考 [Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) 來設置

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

- [Conventional Commits](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits)：

  自動產生 Conventional Commits 模板

#### 增進開發效率

- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)：

  可以在 Visual Studio Code 中使用 Vim 快捷，達到少用滑鼠的目的。我的 vim 快捷鍵設定請見：[settings.json](https://github.com/twgd/my-devenv-setup/blob/master/vscode/settings.json)

- [Codeium: AI Coding Autocomplete and Chat for Python, Javascript, Typescript, Java, Go, and more](https://marketplace.visualstudio.com/items?itemName=Codeium.codeium)

  生成式 AI 寫程式幫手，支援自動補齊程式碼、語意化搜尋專案程式碼、對話功能。可作為 GitHub Copilot 的免費替代方案。可整合在 IDE 中。

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

- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)

  幫助 highlight 有註解 TODO 的地方。

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

- [GitHub Copilot Lab](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-labs)

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

- 登入已下載的 JetBrains Toolbox 並登入帳號，安裝以下軟體：

  - WebStorm

- 下載 Line
- 下載 BeFocused

---

參考資料來源：

- [Mac Setup for Web Development [2022]](https://www.robinwieruch.de/mac-setup-web-development/)
- [偏好的 Visual Studio Code 設定檔 - POY CHANG](https://poychang.github.io/my-vscode-config/)
- [2018 VS Code 設定大補帖與小技巧 - Ryan Hsu](https://medium.com/@mvpdw06/2018-vs-code-設定大補帖與小技巧-24c6269b0cc1)
- [VSCode 如何提高我的寫扣效率 - Larry Lu](https://larrylu.blog/vscode-tips-fe3320f9032a)
