# typed: false
# frozen_string_literal: true

class Gabb < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.9.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-aarch64-apple-darwin.tar.gz"
      sha256 "13846c3cda43ecb867720016b943bbe7422635d161d9fac4c49da3bdf9ed47c9"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-apple-darwin.tar.gz"
      sha256 "3ae2f99dcd0dfaee518bb61c732af30507766acd73ad4f1940c45057f35459dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b6b3a7425325e194aff7675e0196e9b4ec150d11a4e3b858a84d4a685d07437b"
    end
  end

  def install
    bin.install "gabb"
  end

  test do
    assert_match "gabb", shell_output("#{bin}/gabb --version")
  end
end
