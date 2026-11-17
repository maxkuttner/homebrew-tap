# Rendered by packaging/homebrew/render.sh on every release and pushed to
# maxkuttner/homebrew-tap as Formula/openoms.rb. Edit the template, not the tap.
class Openoms < Formula
  desc "Order management system: server, web cockpit and CLI in one binary"
  homepage "https://openoms.dev/"

  on_macos do
    on_arm do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.10.0/oms-aarch64-apple-darwin.tar.gz"
      sha256 "969d00baf1f4f5206c7bb0995c74f2ef07f2b42ea4202ba1c4768e6898c664d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/maxkuttner/openoms/releases/download/v0.10.0/oms-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb90b8ae273c5a33488c5b784349b6a7a591e67acac8130827f2996e9414616a"
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
      Guide: https://openoms.dev/getting-started/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oms --version")
  end
end
