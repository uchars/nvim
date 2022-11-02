# NVIM Configuration
## Stuff to install
* [NodeJS](https://nodejs.org/en/)
* [Chocolately](https://chocolatey.org/install)
* [Rust](https://doc.rust-lang.org/cargo/getting-started/installation.html)
* [Go](https://go.dev/)
* [Python](https://www.python.org/)


##### LLVM
> LLVM is required to build Treesitter via clang
```bash
choco install llvm
```

##### Languageservers
> Languageservers are used for autocomplete, etc.

###### Python, TS, CSS, etc.
```bash
npm i -g npm install -g pyright typescript typescript-language-server svelte-language-server vscode-langservers-extracted
```

###### C#
```bash
dotnet tool install --global csharp-ls
```

###### Dart, Flutter
Installed with the flutter framework.

###### CMake
```bash
pip install cmake-language-server
```

###### Angular
```bash
npm install -g @angular/language-server
```

###### Assembly
```bash
cargo install asm-lsp
```

###### Docker
```bash
npm install -g dockerfile-language-server-nodejs
```

###### Bash
```bash
npm i -g bash-language-server
```
