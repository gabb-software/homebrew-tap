# typed: false
# frozen_string_literal: true

class Gabb < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.9.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-aarch64-apple-darwin.tar.gz"
      sha256 "50ca4095bf4172cece1a8776aee1fc9115a706f6176472cbdf144a809f0b4210"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-apple-darwin.tar.gz"
      sha256 "e64112e0c6fd4d05b47c348cb570aa80928d97e667bae311a70a5b5e6d754e17"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "988d0e06a65ddc07da947b9b53d7adaa2ea5fd607842740e5cff3f387790acc8"
    end
  end

  def install
    bin.install "gabb"
  end

  test do
    assert_match "gabb", shell_output("#{bin}/gabb --version")
  end
end
