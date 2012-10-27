u = Usuario.new
u.nome = "Luiz Eduardo"
u.email = "luizeduardokowalski@gmail.com"
u.password = "admin"
u.admin = true
u.save

p = Pagina.new
p.titulo = "Sobre"
p.conteudo = "Texto"
p.uniq = "sobre"
p.save

p2 = Pagina.new
p2.titulo = "Nossa visao"
p2.conteudo = "Nossa visao"
p2.uniq = "visao"
p2.save