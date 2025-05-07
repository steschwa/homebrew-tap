class Fq < Formula
  desc "CLI tool to interact with Firestore"
  homepage "https://github.com/steschwa/fq"
  url "https://github.com/steschwa/fq/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "edac47706953c4f35b19924799b9b36fe736d11c1be206582a61227619419ceb"
  license "MIT"

  bottle do
    root_url "https://github.com/steschwa/homebrew-tap/releases/download/fq-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f25e328775a3f997727502cdbebc85814df12f927b89ed1ed2f22a6a9592cc0"
    sha256 cellar: :any_skip_relocation, ventura:       "edb0c4b10562d9629978fcfab8fae4bbe218b485431ba23a7c31161f11839677"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "07c3f9d17f89327c3af2d5fbea198c01b8e6d5a27cbf9a21d53c4569878b979b"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/steschwa/fq/cmd.Version=#{version} -X github.com/steschwa/fq/cmd.Revision=brew"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/fq", "--help"
  end
end
