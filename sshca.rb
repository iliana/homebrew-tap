class Sshca < Formula
  desc "Bad SSH certificate authority"
  homepage "https://github.com/iliana/sshca"
  url "https://github.com/iliana/sshca/archive/v0.2.0.tar.gz"
  sha256 "869ceaf7573224d09eb3f8a2c3b4ce53a467b2eeeeef77a447f882051b9ca281"
  license "WTFPL"
  head "https://github.com/iliana/sshca.git", branch: "main"

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
