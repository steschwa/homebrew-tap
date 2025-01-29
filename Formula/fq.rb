class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "8700c7956fb12f8a60a25b15d40aa44d9a149490d3c9deb9c6d060ce7c88c5a3"
  license "MIT"

  bottle do
    root_url "https://github.com/steschwa/homebrew-tap/releases/download/fq-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f57317597cc465d9fb128407a376afc25c92f3b30234ede8319e300ed98dae2c"
    sha256 cellar: :any_skip_relocation, ventura:       "2d0f5f85ae86578be7a4153d4255eb21960945ee91b62c50b7514016b97c7879"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c7bcf9087b4077713570deb8f073f9e51fc155691236ffe0f6c6f45f2009d2d5"
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
