# typed: false
# frozen_string_literal: true

class Gabb < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-aarch64-apple-darwin.tar.gz"
      sha256 "5fee2b5aa9092942150ddfd17d8fbb5dec2870cbba9af558f5144ddb827cb539"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-apple-darwin.tar.gz"
      sha256 "1b6ff7c4ad6f8796dd97eeb68dde32b51262d43e370e70031c37d0a8cdc6f52e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3deeec8300a8257f53b827b2068420d76b4501f340bb4f08d4e96bd0c3757f7b"
    end
  end

  def install
    bin.install "gabb"
  end

  test do
    assert_match "gabb", shell_output("#{bin}/gabb --version")
  end
end
