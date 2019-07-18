require 'mkmf'

cabocha_config = with_config('cabocha-config', 'cabocha-config')
enable_config('cabocha-config')

`cabocha-config --libs-only-l`.chomp.split.select { |s| (s =~ /^-L/) == nil }.each { | lib |
  p lib
  have_library(lib)
}

$CPPFLAGS += ' ' + `#{cabocha_config} --cflags`.chomp
$LDFLAGS += ' ' + `#{cabocha_config} --libs`.chomp

have_header('cabocha.h') && create_makefile('cabocha/CaboCha')
