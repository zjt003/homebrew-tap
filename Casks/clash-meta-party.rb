cask "clash-meta-party" do
  arch arm: "arm64"， intel: "x64"

  version "1.6.2"

  on_big_sur :or_newer do
    sha256 arm:   "9cfadb3e29265c6a84b47dda1aba0327d7413aa1bf4d7b7e2861f7536c69f155",
           intel: "634cfbee97c2fe10c95ba2f2e246f22ad4f0df19f180e98b05edde05cb066747"

    url "https://github.com/xishang0128/clash-meta-party/releases/download/#{version}/clash-meta-party-macos-#{version}-#{arch}.pkg",
        verified: "github.com/xishang0128/clash-meta-party"

    pkg "clash-meta-party-macos-#{version}-#{arch}.pkg"
  end

  name "Clash Meta Party"
  desc "Another Mihomo GUI"
  homepage "https://clash-meta.party"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  uninstall launchctl: "party.mihomo.helper",
            pkgutil:   "party.mihomo.app"

  zap trash: "~/Library/Application Support/clash-meta-party"
end
