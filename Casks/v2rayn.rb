cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.10.4"
  sha256 arm:   "dd0c760628502675dd0fe93eaaba8c79d7d84973f4a4377cf1d19d80fd3be54c",
         intel: "c0796b8c67ed7f12b70349994c05675cfc0fc34f74819a981aac423292fb4f66"

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
