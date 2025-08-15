# My Dev Env Setup

受到 [這篇文章](https://www.robinwieruch.de/mac-setup-web-development/) 的啟發，決定在這裡記錄我的開發環境配置。

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
- [ ] dotfiles 備份到 [my-devenv-setup/dotfiles](https://github.com/twgd/my-devenv-setup/tree/master/dotfiles)
- [ ] Cursor 備份 (settings.json & keybindings.json 備份到 [my-devenv-setup/cursor](https://github.com/twgd/my-devenv-setup/tree/master/cursor))
- [ ] VScode 以 Github 帳號同步備份 (settings.json & keybindings.json 也另外備份到 [my-devenv-setup/vscode](https://github.com/twgd/my-devenv-setup/tree/master/vscode))
- [ ] Raycast 匯出備份
- [ ] Notion 備份：使用 [notion-backup](https://github.com/darobin/notion-backup) 及 Github Actions 自動化批次備份（每天一次）

## macOS Settings

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

## Homebrew Setup

1. 下載 [Homebrew](https://brew.sh/)

2. 使用 Homebrew 下載套件 (formulae)：

```shell
brew install \
  wget \
  htop \
  git \
  zsh \
  oven-sh/bun/bun \
  neovim \
  stow \
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
  wezterm \
  iterm2 \
  git-credential-manager \
  cursor \
  visual-studio-code \
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
- WezTerm
- iTerm2
- Cursor
- Visual Studio Code
- Termius
- Tailscale

## Browser Setup

1. Arc 設為預設瀏覽器
2. 同步 bookmarks & tabs & extensions
3. 登入 Google & GitHub
4. 偏好設定：dark mode

- Extensions
  - React dev tools
  - Vimium
  - Wappalyzer - Technology profiler
  - HTML5 Outliner

## DotFiles Setup

- 參考：[How To Easily Manage Your Dotfiles With GNU Stow](https://www.josean.com/posts/how-to-manage-dotfiles-with-gnu-stow)

使用 GNU Stow 管理 dotfiles，方便利用 Git 做版本控制，達到統一管理並同步到 Github 的目的。並使用 Git 子模組來追蹤 kickstart.nvim 的 fork，確保可以輕鬆同步 kickstart.nvim 的更新，並與 dotfiles 儲存庫保持一致。

1. 下載 dotfiles 儲存庫到本地: [my-devenv-setup](https://github.com/twgd/my-devenv-setup)

```shell
git clone --recurse-submodules git@github.com:twgd/my-devenv-setup.git
```

- `--recurse-submodules` 確保子模組（kickstart.nvim）一併被 clone。

2. 確認 stow 已安裝完成，並到 `./dotfiles/` 資料夾內使用 stow 建立軟連結（`./dotfiles/` 資料夾內的結構與 `~/` 資料夾內的結構相同）

```shell
stow -t ~ .
```

P.S. `./cursor/` 及 `./vscode/` 資料夾內的配置設定檔案，因為路徑不在 `~/` 資料夾內，所以要另外手動進行軟連結。

## Raycast Setup

- 匯入 Raycast 偏好設定備份

## Terminal Setup

我目前正轉向使用 WezTerm 作為 Terminal

- 參考：[How To Create An Amazing Terminal Setup With Wezterm](https://www.josean.com/posts/how-to-setup-wezterm-terminal)

1. 確認 WezTerm 已安裝完成，並載入 `~/.wezterm.lua` 設定檔

2. 配置 Zsh (bash replacement) 為預設 shell：確認 Zsh 已下載安裝完成，並將 Zsh 設為預設 shell

3. 安裝 Oh-My-Zsh (Zsh framework)：到 [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 下載安裝

4. 安裝 powerlevel10k (zsh theme)：到 [powerlevel10k](https://github.com/romkatv/powerlevel10k) 下載安裝並配置。用 iTerm2 運行 `p10k configure` 會自動下載推薦的 Nerd Font (支援特殊 icon 的字型)

5. 使用 Oh-My-Zsh 安裝以下 plugin，並確認更新 `~/.zshrc` 配置:

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

---

iTerm2 的安裝：

- 參考：[超簡單！十分鐘打造漂亮又好用的 zsh command line 環境 ](https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f)

配置 iTerm2 的 Color Presets：下載並匯入 [color schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)，選擇 Tomorrow Night Eighties 作為 iTerm2 的 Color Presets

---

## Dev Environments Setup

1. 確認 Git 已下載，並確認 global config 檔案也配置完畢

2. 下載 nvm 並配置：到 [nvm](https://github.com/nvm-sh/nvm) 下載安裝（Homebrew 不支援下載），並確認 `~/.zshrc` 檔案的配置

3. 使用 nvm 下載 node.js 後，再根據專案需求下載 [pnpm](https://pnpm.io/installation) 或 [yarn](https://yarnpkg.com/getting-started/install)

> The preferred way to manage Yarn is by-project and through Corepack, a tool shipped by default with Node.js.
> Modern releases of Yarn aren't meant to be installed globally, or from npm.

4. 設置 Github SSH key，以 SSH 與 Github 連線：參考 [Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) 來設置

## Neovim Setup

目前正在嘗試使用 Neovim 搭配 Claude Code 開發。

1. 確認已下載 neovim

2. 確認載入配置 `~/.config/nvim`

我使用 `kickstart.vim` 開始配置，我的設定檔同步更新在這個 [fork repo](https://github.com/twgd/kickstart.nvim)

## Cursor Setup

2024 年我開始使用 [Cursor](https://www.cursor.com/) 做為主要的編輯器。Cursor 專門打造來搭配 AI 輔助開發，以達到更好的開發效率。

它基於 VSCode 的核心，與 VSCode 有極為相似的介面及功能，從 VSCode 轉移的門檻很低，可以快速匯入 extensions, keybindings 等個人化設定，即能上手開發。

我在 Cursor 所使用的配置設定大致上與 VSCode 相似，可以參考下面的分享。

## Visual Studio Code

Visual Studio Code 是我使用的主要編輯器之一，好好打造編輯器的環境配置有助於提升開發效率。
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

- [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)

### 自訂配置設定檔案

- 自訂配置設定：[settings.json](https://github.com/twgd/my-devenv-setup/blob/master/vscode/settings.json)

- 自訂快捷設定：[keybindings.json](https://github.com/twgd/my-devenv-setup/blob/master/vscode/keybindings.json)

### 設定推薦安裝套件

若團隊協作專案，不一定每個人都已安裝好所需的套件，可以在專案裡配置建議的套件清單，提示協同開發的人安裝。

設定檔案與路徑：`{{projectRoot}}/.vscode/extensions.json`

```json
{
  "recommendations": ["{{projectID}}"]
}
```

## Others

- 下載 Line
- 下載 BeFocused
