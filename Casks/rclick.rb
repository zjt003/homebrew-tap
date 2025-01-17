cask "rclick" do
  version "1.5.2"
  sha256 "e952516a003fef2ef78743de1c566856b6d897ad4a449308304b8b5ff64c74ba"

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
  
  zap trash: "~/Library/Application Support/RClick"
end
