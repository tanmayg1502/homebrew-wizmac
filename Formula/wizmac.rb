class Wizmac < Formula
  desc "Shared macOS automation service and CLI"
  homepage "https://github.com/tanmayg1502/wizmac-releases"
  url "https://github.com/tanmayg1502/wizmac-releases/releases/download/v0.1.8/Wizmac.zip"
  sha256 "0c8b4fcfaad8ad67e3cc3e8f308071fe5abcb1cf5ad55b2e6fb4243c0f575e89"
  license "MIT"

  depends_on macos: ">= :ventura"

  def install
    bin.install "Wizmac.app/Contents/Resources/bin/wizmac"
    bin.install "Wizmac.app/Contents/MacOS/WizmacService"
  end

  service do
    run [opt_bin/"WizmacService"]
    keep_alive true
  end

  test do
    system bin/"wizmac", "help"
    assert_predicate bin/"WizmacService", :exist?
    assert_predicate bin/"WizmacService", :executable?
  end
end
