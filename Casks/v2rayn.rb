cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.11.3"
  sha256 arm:   "2aff22893b541f5e386c4b970d4ebe8bfcd6260e9b910fc705c8f441700cb3a8",
         intel: "f58d4fa3f88e52243b3b91a09a916767a1f8270d7758441d8aaa350712edfb1a"

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
