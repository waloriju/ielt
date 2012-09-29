u = Usuario.new
u.nome = "Luiz Eduardo"
u.email = "luizeduardokowalski@gmail.com"
u.password = "admin"
u.admin = true
u.save

p = Pagina.new
p.titulo = "Sobre"
p.conteudo = "Texto"
p.save