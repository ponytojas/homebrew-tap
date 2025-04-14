require "language/node"

class Bit < Formula
  desc "CLI tool to automate file mongoose, graphql and apollo hooks based on a typescript interface"
  homepage "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli"
  license "MIT"
  url "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "3a94b6f96b5bd9987a66e60a2f9d743de5538a71a6c103467d26facd546bddcc"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Usage: bit [options]", shell_output("#{bin}/bit --help")
  end
end
