class Sshca < Formula
  desc "Bad SSH certificate authority"
  homepage "https://github.com/iliana/sshca"
  license "WTFPL"
  head "https://github.com/iliana/sshca.git", branch: "main"

  depends_on "rust" => :build
  depends_on "awscli"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
