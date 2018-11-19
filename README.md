# Apple Pay Status for BitBar

Shows the status for Apple Pay for a specific country in [BitBar](https://getbitbar.com/). By default, the status is refreshed once per minute

The inspiration for the script was [this article (German language)](https://www.itopnews.de/2018/11/i-mal-1-verfuegbarkeit-von-apple-pay-in-deutschland-bestimmen-und-in-homekit-anzeigen/).

## Installation

Download the `apple_pay_status.1m.sh` script and link/copy it to your BitBar Plugins folder. Make sure that the script is executable:

```bash
chmod +x apple_pay_status.1m.sh
```

Make sure that you have the [jq](https://stedolan.github.io/jq/) tool installed locally, e.g. through [Homebrew](https://brew.sh):

```bash
brew install jq
```

Once you have installed the script and its dependencies, please update the script's configuration (see below), and refresh BitBar to show the plugin's output.

## Configuration

Please edit the script to change the following configuration items:

* `JQ_PATH`: The path to the `jq` executable. By default, this points to `/usr/local/bin/jq`, which is the location for a Homebrew-installed `jq`.
* `REGION`: The region to track on Apple's web site. By default, this is set to `DE` for Germany.
