# frozen_string_literal: true

VERSION = '1.1.1'
PACKAGE = 'pulse'
REPO = "https://github.com/scottbrown/#{PACKAGE}"

# Homebrew formula
class Pulse < Formula
  desc 'A Risk and Performance measurement framework CLI application for organizational programs (e.g. Information Security, Legal).'
  homepage REPO
  license 'MIT'
  version VERSION

  def self.prefix
    "#{REPO}/releases/download/v#{VERSION}/#{PACKAGE}"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "#{prefix}-darwin-arm64.tar.gz"
      sha256 '725eda45360f609e533795c344b5ba9b76ae94f35b15445bca05e17cc7fed3f7'
    else
      url "#{prefix}-darwin-amd64.tar.gz"
      sha256 'e0e0747d4688cf42244e19ee6563e557ceabc8dbdf51f6c1c931190b54ab0e8e'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{prefix}-linux-arm64.tar.gz"
      sha256 'f3f6ad17e497aa19b5ffb76752b02db85cbfb733d45cc873d6830eabdba9e9c6'
    else
      url "#{prefix}-linux-amd64.tar.gz"
      sha256 '22d347c260d4b7c9f48f4cf8fd5e5a900b3dc2951ecac569715ca7c5494f06b3'
    end
  end

  def install
    bin.install PACKAGE
  end

  test do
    system "#{bin}/#{PACKAGE}", '--help'
  end
end
