cask "sparkle" do
  arch arm: "arm64"， intel: "x64"

  version "1.6.2"

  on_big_sur :or_newer do
    sha256 arm:   "0d1ccc3e3d8a75dc8909ce385903ea0c4a77705ef79aa0ca17e7f4bdcbbcdec3",
           intel: "6221453d04ffd5cf88d6c62258f6ac691277a65e086a512adb566cd6309a9a97"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg",
        verified: "github.com/xishang0128/sparkle"

    pkg "sparkle-macos-#{version}-#{arch}.pkg"
  end

  name "sparkle"
  desc "Another Mihomo GUI"
  homepage "https://sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  uninstall launchctl: "sparkle.helper",
            pkgutil:   "sparkle.app"

  zap trash: "~/Library/Application Support/sparkle"
end
