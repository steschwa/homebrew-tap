class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "8700c7956fb12f8a60a25b15d40aa44d9a149490d3c9deb9c6d060ce7c88c5a3"
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
