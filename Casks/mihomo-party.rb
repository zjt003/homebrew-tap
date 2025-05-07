cask "mihomo-party" do
  arch arm: "arm64", intel: "x64"

  version "1.7.3"

  on_catalina do
    sha256 arm:   "1b0dcb4d389f3e2f73f90712fb453a8d4fbe336effa0375ba363e5ac9217893f",
           intel: "2e084c33a7e2dd5fe7f8f710ec04849a7e735f6a3a72cbee30ab5a65a79f5cdd"

    url "https://github.com/mihomo-party-org/mihomo-party/releases/download/v#{version}/mihomo-party-catalina-#{version}-#{arch}.pkg",
        verified: "github.com/mihomo-party-org/mihomo-party"

    pkg "mihomo-party-catalina-#{version}-#{arch}.pkg"
  end
  on_big_sur :or_newer do
    sha256 arm:   "9cfadb3e29265c6a84b47dda1aba0327d7413aa1bf4d7b7e2861f7536c69f155",
           intel: "634cfbee97c2fe10c95ba2f2e246f22ad4f0df19f180e98b05edde05cb066747"

    url "https://github.com/mihomo-party-org/mihomo-party/releases/download/v#{version}/mihomo-party-macos-#{version}-#{arch}.pkg",
        verified: "github.com/mihomo-party-org/mihomo-party"

    pkg "mihomo-party-macos-#{version}-#{arch}.pkg"
  end

  name "Mihomo Party"
  desc "Another Mihomo GUI"
  homepage "https://mihomo.party/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  uninstall launchctl: "party.mihomo.helper",
            pkgutil:   "party.mihomo.app"

  zap trash: "~/Library/Application Support/mihomo-party"
end
