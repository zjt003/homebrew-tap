cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.10.5"
  sha256 arm:   "f888b6ee51125b90fd4cbf1d3fea4b8742a449451f4e2a8cf378622c7647e0f9",
         intel: "fa977db65ab0179dd8af68aa5f22eed5314112f4f1a0abd8e96d316b597ec7bf"

  url "https://github.com/2dust/v2rayN/releases/download/#{version}/v2rayN-macos-#{arch}.dmg",
      verified: "github.com/2dust/v2rayN"
  name "v2rayN"
  desc "GUI client for Xray,sing-box..."
  homepage "https://github.com/2dust/v2rayN"

  # A tag using the stable version format is sometimes marked as "Pre-release"
  # on the GitHub releases page, so we have to use the `GithubLatest` strategy.
  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "v2rayN.app"

  # 设置权限
  # uninstall_preflight do
    # set_ownership "/Library/Application Support/v2rayN"
  # end
  # 删除文件 根路径需要管理员权限
  # uninstall delete: "/Library/Application Support/v2rayN"

  zap trash: "~/Library/Application Support/v2rayN"
end
