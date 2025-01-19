cask "v2rayn" do
  arch arm: "arm64", intel: "64"

  version "7.7.0"
  sha256 arm:   "ee5e33cb1df00f33e73515eab892e14db9e34a4188769769c64daa0ae9b53e8f",
         intel: "069c3941d52b65ce197d9488f530c5331c2f193ee9b5ee18cd32cc49275ddc28"

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
