require "language/node"

class Bit < Formula
  desc "CLI tool to automate file mongoose, graphql and apollo hooks based on a typescript interface"
  homepage "https://atc-github.azure.cloud.bmw/qxz5hea/bit-cli"
  url "ssh://git@atc-github.azure.cloud.bmw/qxz5hea/bit-cli.git",
      tag:      "v2.0.0",
      revision: "YOUR_COMMIT_SHA_HERE"
  license "MIT"
  depends_on "node"

  def install
    # Install dependencies
    system "npm", "install"

    # Build the tool (e.g., compile TypeScript to JS)
    system "npm", "run", "build"

    # Install to Homebrew path
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    # Symlink the bin command(s)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Usage: bit [options]", shell_output("#{bin}/bit --help")
  end
end
