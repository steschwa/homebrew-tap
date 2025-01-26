class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "11552de7615bd092e24063c492531f998d47bbace0c29145e04f5b27286ba29e"
  license "MIT"

  bottle do
    root_url "https://github.com/steschwa/homebrew-tap/releases/download/fq-1.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d0c2838fdf00f580155ff7c61d4a18f523420fa1520fe7ebde2823c64294a001"
    sha256 cellar: :any_skip_relocation, ventura:       "363b4dca2433b1fe3b769f687fd58c20064cee03690f4a2f3f8f032d763d86d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8116424606dc4b3fd5e9a126285ead4cc84a91ad6958f01171dcaaf513b939a8"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/steschwa/fq/cmd.Version=#{version} -X github.com/steschwa/fq/cmd.CommitSHA=brew"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/fq", "--help"
  end
end
