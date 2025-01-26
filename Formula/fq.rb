class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "11552de7615bd092e24063c492531f998d47bbace0c29145e04f5b27286ba29e"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/steschwa/fq/cmd.Version=#{version} -X github.com/steschwa/fq/cmd.CommitSHA=brew"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/fq", "--help"
  end
end
