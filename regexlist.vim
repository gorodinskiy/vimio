" To use these regexes type :C-R=<Tab> or /C-R=<Tab> or :%s/C-R=<Tab>
" and vim will show all available options
" convert require to import
let requireImport = "\\v(const|var|let)\\s*(\\S*|\\{[^\\}]*\\})\\s*\\=\\s*require\\('?\"?([^'\"]*)'?\"?\\).*/import \\2 from '\\3';"

" convert function to arrow function
let functionArrow = "\\vfunction\\s*(\\S*)\\s*(\\([^)]*\\))/const \\1 = \\2 =>"

let markdownLinks = "\\%V\\v(.*)/[\\1](\\1)"

let kebab2pascal = "\\%V\\v(^|-)([a-z])/\\U\\2"
let snake2pascal = "\\%V\\v(^|_)([a-z])/\\U\\2"
let kebab2camel = "\\%V\\v-([a-z])/\\U\\1"
let snake2camel = "\\%V\\v_([a-z])/\\U\\1"
let camel2kebab = "\\%V\\v([A-Z])/-\\L\\1"
let camel2snake = "\\%V\\v([A-Z])/_\\L\\1"
let pascal2kebab = "\\%V\\v([A-Z])/-\\L\\1"
let pascal2snake = "\\%V\\v([A-Z])/_\\L\\1"
