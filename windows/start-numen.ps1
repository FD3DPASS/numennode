$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Test-Path '.\numen.exe')) { throw 'numen.exe not found. Build the Windows node first.' }
if (-not (Test-Path '.\mainnet-raw.json')) { throw 'mainnet-raw.json not found.' }
& '.\numen.exe' --chain '.\mainnet-raw.json' --base-path "$env:LOCALAPPDATA\Numen\node"
