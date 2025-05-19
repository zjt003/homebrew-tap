cask "sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.6.4"

  on_catalina do
    sha256 arm:   "1b0dcb4d389f3e2f73f90712fb453a8d4fbe336effa0375ba363e5ac9217893f",
           intel: "2e084c33a7e2dd5fe7f8f710ec04849a7e735f6a3a72cbee30ab5a65a79f5cdd"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg",
        verified: "https://github.com/xishang0128/sparkle"

    pkg "sparkle-macos-#{version}-#{arch}.pkg"
  end
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

  depends_on macos: ">= :catalina"

  uninstall launchctl: "sparkle.helper",
            pkgutil:   "sparkle.app"

  zap trash: "~/Library/Application Support/sparkle"
end
