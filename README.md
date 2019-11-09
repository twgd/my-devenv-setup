# 我的 Visual Studio Code 環境配置

## MAC 初始設定

在 Terminal 中使用 `code` 指令：

- `Command ⌘ + Shift ⇧ + P` 開啟命令列
- 輸入 `install` 關鍵字
- 按下 `Shell Command: Install ‘code’ command in PATH`



## Extensions

### git 相關

- git-autoconfig(https://marketplace.visualstudio.com/items?itemName=shyykoserhiy.git-autoconfig)
- gitflow(https://marketplace.visualstudio.com/items?itemName=vector-of-bool.gitflow)
- Git History(https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)

### 開模板

- Blueprint - New Files and Folders of Files from Templates(https://marketplace.visualstudio.com/items?itemName=teamchilla.blueprint)


### hot-reload

- live server(https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)
- live sass compiler(https://marketplace.visualstudio.com/items?itemName=ritwickdey.live-sass)

### SCSS

- SCSS Refactoring(https://marketplace.visualstudio.com/items?itemName=lukazakrajsek.scss-refactoring)

### Linter

- ESLint(https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

### 排版

- Prettier - Code formatter(https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

{
  "key": "shift+alt+f",
  "command": "editor.action.formatDocument",
  "when": "editorHasDocumentFormattingProvider && editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
}
{
  "key": "cmd+k cmd+f",
  "command": "editor.action.formatSelection",
  "when": "editorHasDocumentSelectionFormattingProvider && editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly"
}

- indent-rainbow(https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)


### coding 規範

- EditorConfig for VS Code(https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)


### snippets

- ES7 React/Redux/GraphQL/React-Native snippets(https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)


### 外觀

- Material Icon Theme(https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)


### others

- Project Manager(https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)
- Code Spell Checker(https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- cdnjs(https://marketplace.visualstudio.com/items?itemName=JakeWilson.vscode-cdnjs)
- Bookmarks(https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
- WakaTime(https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)


## 我的設定 settings.json

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
  "liveServer.settings.donotShowInfoMsg": true,
  "workbench.startupEditor": "none",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```


## 個別專案配置 

`{{projectRoot}}/.vscode/settings.json`
通常跟 Prettier 有關的設定，依專案來配置，才不會影響到舊專案原先的設定。

```json
{
  'editor.formatOnSave': true,
  'prettier.singleQuote': true,
  'prettier.semi': true,
  'prettier.printWidth': 120,
  'prettier.trailingComma': 'es5',
  'prettier.tabWidth': 2
}
```

`formatOnSave` 儲存時自動格式化
`singleQuote` 使用單引號
`semi` 結束是否加分號
`printWidth` 行寬
`trailingComma` 尾隨逗號
`tabWidth` 縮排空幾格


## 設定推薦安裝套件

`{{projectRoot}}/.vscode/extensions.json`

```json
{
  "recommendations": [
    "{{projectID}}"
  ]
}
```

## keyboard shortcuts

### 文件
- [Visual Studio Code Tips and Tricks](https://github.com/Microsoft/vscode-docs/blob/master/docs/getstarted/tips-and-tricks.md)

- [windows](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

- [macOS](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf)

- [Refactoring with Visual Studio Code](https://johnpapa.net/refactoring-with-visual-studio-code/)


### 常用

- 開啟命令列：`Command ⌘ + Shift ⇧ + P`
- 搜尋並開啟檔案：`Command ⌘ + P`
- 關閉當前檔案：`Command ⌘ + W`
- 開啟或關閉 Terminal：Command ⌘ + `