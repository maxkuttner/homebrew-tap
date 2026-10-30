# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://maxkuttner.github.io/openoms/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "9368d5e9589deb2751937b7367ea6d35c53a68558595523abbf7dd0cb1ec63d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.6.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34cff55289faab4a09af66f52350b746e4d48ccc9a9b54a14f24007c76a2ee15"
    end
  end

  def install
    bin.install "oms"
  end

  def caveats
    <<~EOS
      Set up the database and cockpit login, then start the server:
        oms init
        oms
      Guide: https://maxkuttner.github.io/openoms/getting-started/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oms --version")
  end
end
