require "language/node"

class Bit < Formula
  desc "CLI tool to automate file mongoose, graphql and apollo hooks based on a typescript interface"
  homepage "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli"
  url "git@atc-github.azure.cloud.bmw:qxz5hea/bit-cli.git",
      tag:      "v2.0.0",
      revision: "b755b2d3e6931ea2bea8acce8d7a38f1c82f3d12"
  license "MIT"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Usage: bit [options]", shell_output("#{bin}/bit --help")
  end
end
