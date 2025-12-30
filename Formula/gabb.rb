# typed: false
# frozen_string_literal: true

class Gabb < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.9.115"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-aarch64-apple-darwin.tar.gz"
      sha256 "17f806fe33ab36cb728a88617ba1368396db86980f9ed3fe53bde2d498d99209"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-apple-darwin.tar.gz"
      sha256 "07c6ddc394fca16e2639a55f23f9278f16d535d7920be45d0308f5f394da18ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "212dfc9b9664f542bac304d45444ba9b531af7116c63d0ef9b5e9c1cace67c85"
    end
  end

  def install
    bin.install "gabb"
  end

  test do
    assert_match "gabb", shell_output("#{bin}/gabb --version")
  end
end
