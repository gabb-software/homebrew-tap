# typed: false
# frozen_string_literal: true

class GabbCli < Formula
  desc "Fast local code indexing CLI for TypeScript and Rust projects"
  homepage "https://github.com/gabb-software/gabb-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-cli-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_AARCH64_SHA256"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-cli-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X86_64_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_LINUX_SHA256"
    end
  end

  def install
    bin.install "gabb-cli"
  end

  test do
    assert_match "gabb-cli", shell_output("#{bin}/gabb-cli --version")
  end
end
