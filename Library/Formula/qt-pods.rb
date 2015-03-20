class QtPods < Formula
  homepage 'http://qt-pods.org'
  head 'https://github.com/qt-pods/qt-pods.git'

  depends_on 'qt5'
  depends_on 'git' => :recommended

  def install
    system "#{Formula['qt5'].bin}/qmake", "PREFIX=#{prefix}"
    system 'make'
    system 'make', 'install'
  end

  test do
    # This is bad. A good test should generate a dummy project with
    # Git-repository-like structure, and run qt-pods-cli in it. But
    # this will do for now.
    system "#{bin}/qt-pods-cli", '--version'
  end
end
