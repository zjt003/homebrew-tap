cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.6.4"

  on_big_sur :or_newer do
    sha256 arm:   "9cfadb3e29265c6a84b47dda1aba0327d7413aa1bf4d7b7e2861f7536c69f155",
           intel: "634cfbee97c2fe10c95ba2f2e246f22ad4f0df19f180e98b05edde05cb066747"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg",
        verified: "https://github.com/xishang0128/sparkle"

    pkg "sparkle-macos-#{version}-#{arch}.pkg"
  end

  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  uninstall launchctl: "sparkle.helper",
            pkgutil:   "sparkle.app"

  zap trash: "~/Library/Application Support/sparkle"
end
