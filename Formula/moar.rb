class Moar < Formula
  desc "Nice to use pager for humans"
  homepage "https://github.com/walles/moar"
  url "https://github.com/walles/moar/archive/refs/tags/v1.8.4.tar.gz"
  sha256 "00fe9ae0631d89bce109ac5b8fb3f5ed0e090df1a5fe9e26cc54fa21f0e40710"
  license "BSD-2-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ce50007be900baf5bed2cf7891350b6f855ae6072ccc98b4c195503cc6a2fb2d"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "ce50007be900baf5bed2cf7891350b6f855ae6072ccc98b4c195503cc6a2fb2d"
    sha256 cellar: :any_skip_relocation, monterey:       "bed1030e76010d17f5279388b91808ec5b26e6fb58e85231c35d1bb4a98841df"
    sha256 cellar: :any_skip_relocation, big_sur:        "bed1030e76010d17f5279388b91808ec5b26e6fb58e85231c35d1bb4a98841df"
    sha256 cellar: :any_skip_relocation, catalina:       "bed1030e76010d17f5279388b91808ec5b26e6fb58e85231c35d1bb4a98841df"
    sha256 cellar: :any_skip_relocation, mojave:         "bed1030e76010d17f5279388b91808ec5b26e6fb58e85231c35d1bb4a98841df"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "26fe3f837b290f636ad3c11c3e47f17b238c5761857e98967e7aff7fac9850a0"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.versionString=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    # Test piping text through moar
    (testpath/"test.txt").write <<~EOS
      tyre kicking
    EOS
    assert_equal "tyre kicking", shell_output("#{bin}/moar test.txt").strip
  end
end
