class Sshca < Formula
  desc "Bad SSH certificate authority"
  homepage "https://github.com/iliana/sshca"
  url "https://github.com/iliana/sshca/archive/v0.2.1.tar.gz"
  sha256 "81122abc0386a5c411c9a0e0aa6561a6c0fba26924e349b0f69b406ce635139f"
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
