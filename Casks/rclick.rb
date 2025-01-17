cask "rclick" do
  version "1.5.2"
  sha256 arm:   "58cf20e2b6921b3725bdc930cb09d1e306384c9018f16010ae91fbb48f04a9c3"

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
