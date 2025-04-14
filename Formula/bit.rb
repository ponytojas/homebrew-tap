require "language/node"

class Bit < Formula
  desc "CLI tool to automate file mongoose, graphql and apollo hooks based on a typescript interface"
  homepage "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli"
  license "MIT"
  url "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ce9af4962adc042c568cabe5c51c893d2eac05c0515a371b7f66634817b9eddf"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Usage: bit [options]", shell_output("#{bin}/bit --help")
  end
end
