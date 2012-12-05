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

p3 = Pagina.new
p3.titulo = "O que cremos"
p3.conteudo = "O que cremos"
p3.uniq = "cremos"
p3.save

p4 = Pagina.new
p4.titulo = "Estrutura"
p4.conteudo = "Estrutura"
p4.uniq = "estrutura"
p4.save

p = Pagina.new
p.titulo = "Historico"
p.conteudo = "Historico"
p.uniq = "historico"
p.save

p = Pagina.new
p.titulo = "Estatuto"
p.conteudo = "Estatuto"
p.uniq = "estatuto"
p.save

p = Pagina.new
p.titulo = "Regimento"
p.conteudo = "Regimento"
p.uniq = "regimento"
p.save