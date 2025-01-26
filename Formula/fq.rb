class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "90e3ceb1acf1658fe4e5b1471970c4a99c888ef369456e2e42885c8f4b77698a"
  license "MIT"

  bottle do
    root_url "https://github.com/steschwa/homebrew-tap/releases/download/fq-1.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e728d0a479bbd03df255e933b562e0c291dae7098e5eedba7b5e8984b12c7c0"
    sha256 cellar: :any_skip_relocation, ventura:       "5e8edbb607ef5a486b7ca260615fa465fb5b2b1e879d0a38c8daa516ca4f828f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3d1f5eebe71399f7b448eeb4667c5137f45078a50db2caa2631bb7dead72a473"
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
