# Homebrew Tap

Personal Homebrew tap maintained by [charliie-dev](https://github.com/charliie-dev).

## Install

```sh
brew install --cask charliie-dev/tap/airbattery
```

Or tap this repository first:

```sh
brew tap charliie-dev/tap
brew install --cask airbattery
```

## Available Casks

| Cask | Description | Upstream |
| --- | --- | --- |
| `airbattery` | Display the battery levels of your devices on your Mac | [lihaoyun6/AirBattery](https://github.com/lihaoyun6/AirBattery) |

> [!NOTE]
> AirBattery's current release is signed with an Apple Development certificate
> rather than a Developer ID certificate. Use
> [Sentinel](https://formulae.brew.sh/cask/alienator88-sentinel) to unquarantine
> the app:
>
> ```sh
> brew install --cask alienator88-sentinel
> open -a Sentinel /Applications/AirBattery.app
> ```
>
> Do not self-sign AirBattery. Self-signing removes entitlements required by
> its Widget Extension and prevents the widget from appearing.

## Repository Structure

```text
.
├── Casks/              # macOS applications
├── .github/workflows/  # CI checks
├── LICENSE
└── README.md
```

## Automatic Updates

Once a day, the autobump workflow checks every cask in this tap with
`brew livecheck`. When a new version is available, Homebrew calculates its
SHA-256 checksum and opens an update pull request automatically.

New casks are included automatically when they define a working `livecheck`
block.
