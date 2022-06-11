class Sshca < Formula
  desc "Bad SSH certificate authority"
  homepage "https://github.com/iliana/sshca"
  url "https://github.com/iliana/sshca/archive/v0.2.0.tar.gz"
  sha256 "869ceaf7573224d09eb3f8a2c3b4ce53a467b2eeeeef77a447f882051b9ca281"
  license "WTFPL"
  head "https://github.com/iliana/sshca.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/iliana/tap"
    sha256 cellar: :any_skip_relocation, big_sur:      "8b817fbb59f239a41f6dab93137a76fc37d6119eab3ed97502555569beaa17b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0a44d9bc01f107e7943dab00f976abae33762ae46f9733f9cff7a9e748921a0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    stdout, stderr, status = Open3.capture3("#{bin}/sshca")
    assert_equal 1, status.exitstatus
    assert_equal "", stdout
    assert_equal "Error: $SSHCA_KEY_ID not set\n\nCaused by:\n    environment variable not found\n", stderr
  end
end
