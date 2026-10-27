class Refract < Formula
  desc "CLI for the Refract LaTeX workspace"
  homepage "https://github.com/ponytojas/Refract"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/ponytojas/Refract/releases/download/v0.1.2/refract-v0.1.2-darwin-arm64.tar.gz"
      sha256 "6a05320af00cb1f881225fb7792840ea2cf0c6fcd806da07689f92fa061645cd"
    end
    on_intel do
      url "https://github.com/ponytojas/Refract/releases/download/v0.1.2/refract-v0.1.2-darwin-amd64.tar.gz"
      sha256 "153c581f5cfda47ae2135313b4cddcb7425355befe521a7d24858626ef72a162"
    end
  end

  def install
    bin.install "refract"
  end

  def caveats
    <<~EOS
      Run `refract login` to sign in with ChatGPT, then upload the credential
      file in your Refract instance under Settings > Assistant.
    EOS
  end

  test do
    assert_match "refract v0.1.2", shell_output("#{bin}/refract version")
    assert_match "refract login", shell_output("#{bin}/refract --help")
    assert_match "-no-browser", shell_output("#{bin}/refract login --help 2>&1")
  end
end
