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
      sha256 "ce070f7b776bf3b443eb0f4be179c4c30413dc330198b5ec32babf009477207d"
    else
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e86327cbc1ab9f216ea2ef234f4afaa49ce9a26306e441684e443b3f263fee5a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gabb-software/gabb-cli/releases/download/v#{version}/gabb-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "966cd5ecb32d79896da2a25f5d47cafcf64465571ffe8ee5d13eb34dfbc8b594"
    end
  end

  def install
    bin.install "gabb-cli"
  end

  test do
    assert_match "gabb-cli", shell_output("#{bin}/gabb-cli --version")
  end
end
