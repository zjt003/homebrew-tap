cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.8.3"
  sha256 arm:   "d0abf9c299982eb71c889d1cb96d334240c4f64c68ed3fe3dba22f36c42fd0d9",
         intel: "56245d9cdc3836308d2e2e9fee37e6e9b3d37e01502b183353d0c9618041dcc7"

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
