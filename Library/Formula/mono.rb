require 'formula'

class Mono < Formula
  homepage 'http://www.mono-project.com/Main_Page'
  url 'http://download.mono-project.com/sources/mono/mono-3.0.2.tar.bz2'
  version '3.0.2'
  sha1 '165aa3f21189b83923fdf84400b527c7c4c4545a'

  depends_on :x11

  def install
    system "./configure", "--with-glib=embedded", "--enable-nls=no",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "gmcs", "--about"    # Mono C# compiler
    system "mono", "--version"  # Mono runtime
  end
end
