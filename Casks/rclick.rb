cask "rclick" do
  version "1.6.4"
  sha256 "dafcc9e39a4f7ee40961b7aec54bcc9180ab68c5dc751adbeef440be78a757e3"

  url "https://github.com/wflixu/RClick/releases/download/v#{version}/RClick-v#{version}.app.zip",
      verified: "github.com/wflixu/RClick"
  name "RClick"
  desc "macos finder contextmenu"
  homepage "https://github.com/wflixu/RClick"

  # A tag using the stable version format is sometimes marked as "Pre-release"
  # on the GitHub releases page, so we have to use the `GithubLatest` strategy.
  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "RClick.app"
  
  zap trash: [
      "~/Library/Application Scripts/4L3563XCBN.cn.wflixu.RClick",
      "~/Library/Application Scripts/cn.wflixu.RClick",
      "~/Library/Application Scripts/cn.wflixu.RClick.FinderSyncExt"
    ]
end
