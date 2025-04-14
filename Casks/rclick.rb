cask "rclick" do
  version "1.6.2"
  sha256 "59b052bd6e7c05cc813f1a1514077ab599a68851929b1a1e9f5d68edd3e4ebec"

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
