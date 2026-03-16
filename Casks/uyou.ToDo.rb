cask "uyou.ToDo" do
  version "3.2.0"
  sha256 "ca487803c9f16257deae8e8a511053a82debe7889fd1540534f0f7a120a49df1"

  url "https://github.com/tonylu110/uyou-todo-electron/releases/download/v#{version}/uyou.ToDo-v#{version}-arm64.dmg",
      verified: "github.com/tonylu110/uyou-todo-electron"
  name "uyou.ToDo"
  desc "macos todo list"
  homepage "https://github.com/tonylu110/uyou-todo-electron"

  # A tag using the stable version format is sometimes marked as "Pre-release"
  # on the GitHub releases page, so we have to use the `GithubLatest` strategy.
  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "uyou.ToDo.app"
  
  zap trash: "~/Library/Application Support/uyou.ToDo"
end
