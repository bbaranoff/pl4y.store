local hclasses = {
  "abc",
  "actionscript",
  "ada",
  "agda",
  "apache",
  "asn1",
  "asp",
  "ats",
  "awk",
  "bash",
  "bibtex",
  "boo",
  "c",
  "changelog",
  "clojure",
  "cmake",
  "coffee",
  "coldfusion",
  "comments",
  "commonlisp",
  "cpp",
  "cs",
  "css",
  "curry",
  "d",
  "default",
  "diff",
  "djangotemplate",
  "dockerfile",
  "dot",
  "doxygen",
  "doxygenlua",
  "dtd",
  "eiffel",
  "elixir",
  "elm",
  "email",
  "erlang",
  "fasm",
  "fortranfixed",
  "fortranfree",
  "fsharp",
  "gcc",
  "glsl",
  "gnuassembler",
  "go",
  "graphql",
  "groovy",
  "hamlet",
  "haskell",
  "haxe",
  "html",
  "idris",
  "ini",
  "isocpp",
  "j",
  "java",
  "javadoc",
  "javascript",
  "javascriptreact",
  "json",
  "jsp",
  "julia",
  "kotlin",
  "latex",
  "lex",
  "lilypond",
  "literatecurry",
  "literatehaskell",
  "llvm",
  "lua",
  "m4",
  "makefile",
  "mandoc",
  "markdown",
  "mathematica",
  "matlab",
  "maxima",
  "mediawiki",
  "metafont",
  "mips",
  "modelines",
  "modula2",
  "modula3",
  "mnobasic",
  "mustache",
  "nasm",
  "nim",
  "noweb",
  "objectivec",
  "objectivecpp",
  "ocaml",
  "octave",
  "opencl",
  "pascal",
  "perl",
  "php",
  "pike",
  "postscript",
  "povray",
  "powershell",
  "prolog",
  "protobuf",
  "pure",
  "purebasic",
  "python",
  "qml",
  "r",
  "raku",
  "relaxng",
  "relaxngcompact",
  "rest",
  "rhtml",
  "roff",
  "ruby",
  "rust",
  "scala",
  "scheme",
  "sci",
  "sed",
  "sgml",
  "sml",
  "spdxcomments",
  "sql",
  "sqlmysql",
  "sqlpostgresql",
  "stata",
  "swift",
  "tcl",
  "tcsh",
  "texinfo",
  "toml",
  "typescript",
  "verilog",
  "vhdl",
  "xml",
  "xorg",
  "xslt",
  "xul",
  "yacc",
  "yaml",
  "zsh",
}
local kHighlightClasses = pandoc.List(hclasses)

function isHighlightClass(class)
  return kHighlightClasses:includes(class)
end

function Pandoc(el)
  if isHighlightClass("yaml") then
      io.stderr:write(".")
  end
end
