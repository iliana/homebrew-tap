cask "mp3tag" do
  version "1.4.4"
  sha256 "701c1469f923f142a8b0ffda4b9afe8ec2cd05f13987d6702cecea289081c00a"

  url "https://updates.mp3tag.app/Mp3tag-#{version}.zip"
  name "mp3tag"
  desc "Audio file metadata editor"
  homepage "https://mp3tag.app/"

  livecheck do
    url "https://mp3tag.app/get/"
    strategy :page_match
    regex(%r{href=.*?/Mp3tag-(\d+(?:\.\d+)*)\.zip}i)
  end

  auto_updates true
  depends_on macos: ">= :mojave"

  app "Mp3tag.app"

  zap trash: [
    "~/Library/Application Scripts/app.mp3tag.Mp3tag",
    "~/Library/Containers/app.mp3tag.Mp3tag",
  ]
end
