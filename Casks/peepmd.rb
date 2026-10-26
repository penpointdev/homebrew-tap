cask "peepmd" do
  version "0.1.0"
  sha256 "e56c9feed9d8c4f1e1399a57e92d654cdb61cd672db832be573f5106841c0681"

  url "https://github.com/penpointdev/peepmd-releases/releases/download/v#{version}/PeepMD-#{version}.zip",
      verified: "github.com/penpointdev/peepmd-releases/"
  name "PeepMD"
  desc "Quick Look preview for Markdown files"
  homepage "https://penpoint.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "PeepMD.app"

  postflight_steps do
    run "/usr/bin/qlmanage", args: ["-r"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Scripts/dev.penpoint.peepmd*",
    "~/Library/Containers/dev.penpoint.peepmd*",
  ]

  caveats <<~EOS
    Open PeepMD once so that macOS registers its Quick Look extension:
      open -a PeepMD
    Then select a Markdown file in Finder and press Space.
  EOS
end
