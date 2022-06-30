class Kijetesantakaluotokieni < Formula
  # rubocop:disable Style/DisableCopsWithinSourceCodeDirective, FormulaAudit/Desc
  desc "kijetesantakalu toki pi ken ante mute"
  # rubocop:enable Style/DisableCopsWithinSourceCodeDirective, FormulaAudit/Desc
  homepage "https://git.2ki.xyz/spiders/kijetesantakaluotokieni"
  url "https://static.crates.io/crates/kijetesantakaluotokieni/kijetesantakaluotokieni-1.0.1.crate"
  sha256 "adf46be7b001c78b3e8ece243dc84f77d86261ce4d00460bc1cbc958adc39063"

  livecheck do
    url "https://crates.io/api/v1/crates/kijetesantakaluotokieni/versions"
    regex(/"num":\s*"(\d+(?:\.\d+)+)"/i)
  end

  depends_on "rust" => :build

  def install
    system "tar", "--strip-components", "1", "-xzvf", "kijetesantakaluotokieni-#{version}.crate"
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"kijetesantakaluotokieni", "toki, ma o!"
  end
end
