# Homebrew Tap

Personal Homebrew tap maintained by [charliie-dev](https://github.com/charliie-dev).

## Install

```sh
brew tap charliie-dev/tap
brew trust charliie-dev/tap
brew install --cask airbattery
```

> [!IMPORTANT]
> Homebrew refuses to load casks from a third-party tap until you trust it.
> If you skip `brew trust`, the install fails with:
>
> ```text
> Error: Refusing to load cask charliie-dev/tap/airbattery from untrusted tap charliie-dev/tap.
> ```
>
> Run `brew trust charliie-dev/tap` to trust the whole tap, or
> `brew trust --cask charliie-dev/tap/airbattery` to trust a single cask.

## Available Casks

| Cask | Description | Upstream |
| --- | --- | --- |
| `airbattery` | Display the battery levels of your devices on your Mac | [lihaoyun6/AirBattery](https://github.com/lihaoyun6/AirBattery) |
| `pear-desktop` | YouTube Music desktop app with custom plugins | [pear-devs/pear-desktop](https://github.com/pear-devs/pear-desktop) |

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
