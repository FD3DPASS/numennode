# Numen Windows build kit (experimental)

This kit adds a native Windows GitHub Actions build. It does not contain a compiled executable and has NOT been tested on a Windows runner yet.

## Apply to repository
Copy `.github/workflows/windows-node.yml` and `windows/start-numen.ps1` into the matching locations in the Numen repository. Commit and push to `master`, then open GitHub > Actions > Windows node build (experimental) > Run workflow.

If the build passes, download the `numen-windows-x64` artifact, unzip the inner archive, and run `powershell -ExecutionPolicy Bypass -File .\start-numen.ps1` in the extracted folder.

## Local build
Install Visual Studio 2022 Build Tools (Desktop development with C++), Rust MSVC, LLVM/Clang, Git, CMake, and protoc. Then in PowerShell:

```
rustup default stable-x86_64-pc-windows-msvc
rustup component add rust-src
rustup target add wasm32v1-none
cargo build --release --locked -p numen
.\target\release\numen.exe --version
```

This may fail because upstream Substrate/native dependencies have not been validated on Windows. Check CI logs before distributing any binary. The Windows package builds only `numen.exe`, not the separate `eth-rpc` service. Do not publish as a stable release until syncing, mining and RPC have been tested against mainnet.
