# typed: false
# frozen_string_literal: true

class Gabb < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.9.88"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-aarch64-apple-darwin.tar.gz"
      sha256 "491300249909b148e275014ce275365f4b81867431eebe031f7cb0264de3d3d4"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-apple-darwin.tar.gz"
      sha256 "0a9ec34aa3e23e7b8f8b46345793d375d0d4c89e9cb7e4b2535032ffb4ae730e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ccd204ac0778e8973fc34c82a2e43ad8e4adc3b11e4154b2d5e02aed82c2ec40"
    end
  end

  def install
    bin.install "gabb"
  end

  test do
    assert_match "gabb", shell_output("#{bin}/gabb --version")
  end
end
