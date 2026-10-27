class Refract < Formula
  desc "CLI for the Refract LaTeX workspace"
  homepage "https://github.com/ponytojas/Refract"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/ponytojas/Refract/releases/download/v0.1.1/refract-v0.1.1-darwin-arm64.tar.gz"
      sha256 "fd750c4d6572b720e42e8f40b4c78878b589ae86db0e14c0471767d58e48358c"
    end
    on_intel do
      url "https://github.com/ponytojas/Refract/releases/download/v0.1.1/refract-v0.1.1-darwin-amd64.tar.gz"
      sha256 "8448b12863be835d83df66812a3e1a1635e60474d9959828f4c2f18ec131d1ab"
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
    assert_match "refract v0.1.1", shell_output("#{bin}/refract version")
    assert_match "refract login", shell_output("#{bin}/refract --help")
    assert_match "-no-browser", shell_output("#{bin}/refract login --help 2>&1")
  end
end
